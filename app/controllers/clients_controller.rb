class ClientsController < ApplicationController
  # Clientでログインしていなければsign_inページにリダイレクトされる
  before_action :authenticate_client!
  
  def mypage
    @client = current_client
    @reservations = @client.reservations.eager_load(:reservation_frame).merge(Reservation.order(:date))
  end
  
  def edit
  end
  
end
