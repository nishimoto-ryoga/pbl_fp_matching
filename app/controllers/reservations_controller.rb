class ReservationsController < ApplicationController
  def new
    @reservation = current_client.reservations.new
    @reservation_frame = ReservationFrameDecorator.decorate(ReservationFrame.find(params[:reservation_frame_id]))
  end

  def create
    reservation = current_client.reservations.new(reservation_params)
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
