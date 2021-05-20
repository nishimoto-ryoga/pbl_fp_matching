class PlannersController < ApplicationController
  # Plannerでログインしていなければsign_inページにリダイレクトされる
  before_action :authenticate_planner!

  def mypage
    @planner = current_planner
    @reservation_frames = ReservationFrame.where(planner_id: current_planner.id).order(:date).includes(:time_frame)
  end

  def show
    binding.pry
    @planner = current_planner
    @reservation_frames = ReservationFrame.where(planner_id: current_planner.id).order(:date).includes(:time_frame)
  end

  def edit
  end
end
