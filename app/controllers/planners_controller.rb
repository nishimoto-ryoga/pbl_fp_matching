class PlannersController < ApplicationController
  # Pllannerでログインしていなければsign_inページにリダイレクトされる
  before_action :authenticate_planner!

  def show
    @planner = Planner.find(params[:id])
  end

  def edit
  end
end
