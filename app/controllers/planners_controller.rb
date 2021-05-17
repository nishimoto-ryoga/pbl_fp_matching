class PlannersController < ApplicationController
  # Plannerでログインしていなければsign_inページにリダイレクトされる
  before_action :authenticate_planner!

  def show
    @planner = current_planner
    @reservation_frames = ReservationFrame.where(planner_id: current_planner.id).order(:date)
  end

  def edit
  end
end
