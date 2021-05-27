class ClientsController < ApplicationController
  # Clientでログインしていなければsign_inページにリダイレクトされる
  before_action :authenticate_client!
  
  def mypage
    @client = current_client
    @reservations = @client.reservations.eager_load(:reservation_frame).order(:date)
  end
  
  def update
    client = current_client
    render json: client if client.update!(client_params)
  end
  
  private

  def client_params
    params.require(:client).permit(:name)
  end
  
end
