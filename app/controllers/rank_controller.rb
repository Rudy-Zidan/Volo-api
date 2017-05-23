class RankController < ApplicationController
  before_action :validate_token

  def index
    render json: @player.get_rank, status: 200
  end
end
