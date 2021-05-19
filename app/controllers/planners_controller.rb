class PlannersController < ApplicationController
  # Pllannerでログインしていなければsign_inページにリダイレクトされる
  before_action :authenticate_planner!

  def mypage
    @planner = current_planner
  end

  def edit
  end
end
