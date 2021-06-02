class HomeController < ApplicationController
  def top
    redirect_to mypage_clients_path if client_signed_in?
    redirect_to mypage_planners_path if planner_signed_in?
  end

  def top_fp
    redirect_to mypage_clients_path if client_signed_in?
    redirect_to mypage_planners_path if planner_signed_in?
  end
end
