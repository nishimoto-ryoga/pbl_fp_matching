class PlannersController < ApplicationController
  # Plannerでログインしていなければsign_inページにリダイレクトされる
  before_action :authenticate_planner!, only: :mypage
  before_action :authenticate_client!, only: %i[index show]

  def mypage
    @planner = current_planner
    @reservation_frames = @planner.reservation_frames.order(:date).eager_load(:time_frame).not_canceled
  end

  def index
    @client = current_client
    @planners = Planner.all
  end

  def show
    @client = current_client
    @planner = Planner.find(params[:id])
    @reservation_frames = @planner.reservation_frames.order(:date).eager_load(:time_frame).not_canceled
  end

  def edit
    @planner = current_planner
  end

  def update
    if current_planner.update(planner_params)
      flash[:success] = '編集しました。'
      redirect_to mypage_planners_path
    else
      flash.now[:danger] = '編集に失敗しました。'
      @planner = current_planner
      render :edit
    end
  end

  private

    def planner_params
      params.require(:planner).permit(:name)
    end
end
