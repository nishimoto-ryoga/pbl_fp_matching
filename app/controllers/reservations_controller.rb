class ReservationsController < ApplicationController
  def new
    @client = current_client
    @reservation = current_client.reservations.new
    @reservation_frame = ReservationFrameDecorator.decorate(ReservationFrame.find(params[:reservation_frame_id]))
  end

  def create
    reservation = current_client.reservations.new(reservation_params)
    if reservation.save
      flash[:success] = '予約しました。'
      redirect_to mypage_clients_path
    else
      flash[:danger] = '予約に失敗しました。'
      redirect_to planners_path
    end
  end

  def destroy
    reservation = current_client.reservations.find(params[:id])
    if reservation.destroy
      flash[:success] = '予約をキャンセルしました。'
    else
      flash[:danger] = '予約のキャンセルに失敗しました。'
    end
    redirect_to mypage_clients_path
  end

  private

    def reservation_params
      params.require(:reservation).permit(:reservation_frame_id)
    end
end
