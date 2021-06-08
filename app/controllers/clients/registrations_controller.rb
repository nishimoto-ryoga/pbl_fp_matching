class Clients::RegistrationsController < Devise::RegistrationsController
  before_action :planner_cannot_login_to_client

  def planner_cannot_login_to_client
    return unless planner_signed_in?

    flash[:danger] = 'ログアウトしてから再度お試しください。'
    redirect_to mypage_planners_path
  end
end
