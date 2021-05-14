class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  # ログイン後遷移先指定
  def after_sign_in_path_for(resource)
    # FPの場合はFPのマイページに飛ばす
    planner_path(current_planner.id) if planner_signed_in?
    # クライアントの場合はクライアントのマイページに飛ばす
    client_path(current_client.id) if client_signed_in?
  end
  
  # ログアウト後後遷移先指定
  def after_sign_out_path_for(resource)
    if resource == :planner
        top_fp_path
    else
        root_path
    end
  end

  protected

  # ユーザー登録時に名前を登録できるようにする
  # https://github.com/heartcombo/devise#strong-parameters
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
