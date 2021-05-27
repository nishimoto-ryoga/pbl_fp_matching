class PlannersController < ApplicationController
  # Plannerでログインしていなければsign_inページにリダイレクトされる
  before_action :authenticate_planner!, only: :mypage
  before_action :authenticate_client!, only: [:index, :show]

  def mypage
    @planner = current_planner
    @reservation_frames = @planner.reservation_frames.order(:date).eager_load(:time_frame)
  end

  def index
    @planners = Planner.all
  end

  def show
    @planner = Planner.find(params[:id])
    @reservation_frames = @planner.reservation_frames.order(:date).eager_load(:time_frame)
  end

  def update
    planner = current_planner
    render json: planner if planner.update!(planner_params)
  end
  
  private

  def planner_params
    params.require(:planner).permit(:name)
  end

end
