class PlayersController < ApplicationController
  before_action :validate_token, except: [:create]

  def index
    render json: Player.all, status: 200
  end

  def create
    player = Player.find_or_create_by({facebook_id: params[:id], name: params[:name]})
    render json: {status: player.persisted?, token: player.token}, status: 200
  end

  def update_score
    @player.update_friends(params[:friends]) if params[:friends]
    if(@player.score >= params[:score] && @player.update({score: @player.score + params[:score]}))
      render json: {status: true}, status: 200
    elsif @player.update({score: params[:score]})
      render json: {status: true}, status: 200
    else
      render json: {status: false}, status: 200
    end
  end
end
