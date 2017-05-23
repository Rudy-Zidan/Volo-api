class ApplicationController < ActionController::API

  def validate_token
    return failed_response if params[:token].blank?
    @player = Player.find_by_token(params[:token])
    return failed_response if @player.nil?
  end

  private
    def failed_response
      render json: {status: false}, status: 400
    end
end
