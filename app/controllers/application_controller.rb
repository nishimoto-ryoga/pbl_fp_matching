class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    planner_path(current_planner) if planner_signed_in?
    mypage_clients_path if client_signed_in?
  end
  
  def after_sign_out_path_for(resource)
    resource == :planner ? top_fp_path : root_path
  end

  protected

  # ユーザー登録時に名前を登録できるようにする
  # https://github.com/heartcombo/devise#strong-parameters
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
