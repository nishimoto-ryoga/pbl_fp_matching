class PlannersController < ApplicationController
  # Planner/Clinetでログインしていなければsign_inページにリダイレクトされる
  before_action :authenticate_planner!, only: :mypage
  before_action :authenticate_client!, only: :index

  def index
    @planners = Planner.all
  end

  def mypage
    @planner = current_planner
    @reservation_frames = ReservationFrame.where(planner_id: current_planner.id).order(:date).includes(:time_frame)
  end

  def show
    @planner = current_planner
    @reservation_frames = ReservationFrame.where(planner_id: current_planner.id).order(:date).includes(:time_frame)
  end

  def edit
  end
end
