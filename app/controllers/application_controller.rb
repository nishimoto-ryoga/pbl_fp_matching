class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :planner_cannot_login_to_client

  def after_sign_in_path_for(_resource)
    return mypage_planners_path if planner_signed_in?

    mypage_clients_path if client_signed_in?
  end

  def after_sign_out_path_for(resource)
    resource == :planner ? top_fp_path : root_path
  end

  def planner_cannot_login_to_client
    return unless request.path.in?(['/clients/sign_up', '/clients/sign_in']) && planner_signed_in?

    flash[:danger] = 'ログアウトしてから再度お試しください。'
    redirect_to mypage_planners_path
  end

  protected

  # ユーザー登録時に名前を登録できるようにする
  # https://github.com/heartcombo/devise#strong-parameters
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end
end
