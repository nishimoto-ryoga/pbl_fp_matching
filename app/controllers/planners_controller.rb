class PlannersController < ApplicationController
  # Plannerでログインしていなければsign_inページにリダイレクトされる
  before_action :authenticate_planner!, only: :mypage
  before_action :authenticate_client!, only: [:index, :show]

  def mypage
    @planner = current_planner
    @reservation_frames = ReservationFrame.where(planner_id: current_planner.id).order(:date).preload(:time_frame)
  end

  def index
    @planners = Planner.all
  end

  def show
    @planner = Planner.find(params[:id])
    @reservation_frames = ReservationFrame.where(planner_id: params[:id]).order(:date).preload(:time_frame)
  end

end
