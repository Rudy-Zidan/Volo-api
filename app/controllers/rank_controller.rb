class RankController < ApplicationController

  def index
    player = Player.find_by_facebook(params[:id])
    render json: player.get_rank, status: 200
  end
end
