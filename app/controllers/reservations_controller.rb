class ReservationsController < ApplicationController
  def new
    @reservation = Reservation.new
    @reservation_frame = ReservationFrame.find(params[:reservation_frame_id])
  end

end
