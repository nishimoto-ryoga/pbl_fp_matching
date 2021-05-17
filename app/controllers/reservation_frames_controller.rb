class ReservationFramesController < ApplicationController
  
  def new
    @reservation_frame = ReservationFrame.new()
  end

  def create
    reservation_frame = ReservationFrame.new(reservation_frames_params)
    reservation_frame.planner_id = current_planner.id
    if reservation_frame.save
      redirect_to planner_path(current_planner.id)
    else
      render :new
    end
  end

  private

    def reservation_frames_params
      params.require(:reservation_frame).permit(:date, :time_frame_id)
    end
end
