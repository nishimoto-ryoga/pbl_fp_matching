class ReservationFramesController < ApplicationController
  
  def new
    @reservation_frame = current_planner.reservation_frames.new
  end

  def create
    @reservation_frame = current_planner.reservation_frames.new(reservation_frames_params)
    if @reservation_frame.save
      flash[:success] = "予約枠を登録しました。"
      redirect_to mypage_planners_path
    else
      flash.now[:danger] = "予約枠の登録に失敗しました。"
      render :new
    end
  end

  def destroy
    reservation_frame = current_planner.reservation_frames.find(params[:id])
    if reservation_frame.update(canceled_at: Time.current)
      flash[:success] = "予約枠を削除しました。"
      redirect_to mypage_planners_path
    else
      flash[:danger] = "予約枠の削除に失敗しました。"
      redirect_to mypage_planners_path
    end
  end

  private

  def reservation_frames_params
    params.require(:reservation_frame).permit(:date, :time_frame_id)
  end
end
