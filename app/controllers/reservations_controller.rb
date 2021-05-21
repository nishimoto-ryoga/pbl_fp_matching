class ReservationsController < ApplicationController
  def new
    @reservation = Reservation.new
    @reservation_frame = ReservationFrame.find(params[:reservation_frame_id])
  end

  def create
    reservation = Reservation.new(reservation_params)
    reservation.client_id = current_client.id
    if reservation.save
      redirect_to mypage_clients_path
    else
      redirect_to planners_path
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:reservation_frame_id)
  end
end
