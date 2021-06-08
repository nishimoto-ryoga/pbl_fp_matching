class Planners::RegistrationsController < Devise::RegistrationsController
  before_action :client_cannot_login_to_planner

  def client_cannot_login_to_planner
    return unless client_signed_in?

    flash[:danger] = 'ログアウトしてから再度お試しください。'
    redirect_to mypage_clients_path
  end
end
