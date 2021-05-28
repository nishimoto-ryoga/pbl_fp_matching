class Api::PlannersController < ApplicationController

  def update
    planner = current_planner
    render json: planner if planner.update!(planner_params)
  end
  
  private

  def planner_params
    params.require(:planner).permit(:name)
  end

end
