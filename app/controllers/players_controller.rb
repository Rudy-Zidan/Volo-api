class PlayersController < ApplicationController
  def index
    render json: Player.all, status: 200
  end

  def create
    player = Player.new({facebook_id: params[:id], name: params[:name]})
    render json: {status: player.save}, status: 200
  end

  def update_score
    player = Player.find_by_facebook(params[:id])
    player.update_friends(params[:friends]) if params[:friends]
    if player.update({score: params[:score]})
      render json: {status: true}, status: 200
    else
      render json: {status: false}, status: 200
    end
  end
end
