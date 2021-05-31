class PlannersController < ApplicationController
  # Plannerでログインしていなければsign_inページにリダイレクトされる
  before_action :authenticate_planner!, only: :mypage
  before_action :authenticate_client!, only: %i[index show]

  def mypage
    @planner = current_planner
    @reservation_frames = @planner.reservation_frames.order(:date).eager_load(:time_frame).not_canceled
  end

  def index
    @planners = Planner.all
  end

  def show
    @planner = Planner.find(params[:id])
    @reservation_frames = @planner.reservation_frames.order(:date).eager_load(:time_frame).not_canceled
  end

  def edit
    @planner = current_planner
  end

  def update
    @planner = current_planner
    if @planner.update!(planner_params)
      flash[:success] = '編集しました。'
      redirect_to mypage_planners_path
    else
      flash.now[:danger] = '編集に失敗しました。'
      render :edit
    end
  end

  private

    def planner_params
      params.require(:planner).permit(:name)
    end
end
