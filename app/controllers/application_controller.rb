class ApplicationController < ActionController::Base
  # 新規登録時にuser_nameキーのパラメーターを追加で許可
  before_action :configure_permitted_parameters, if: :devise_controller?
  #Bootstrapのフラッシュメッセージ
  add_flash_types :success, :info, :warning, :danger

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name])
    # アカウント編集の時にnameとprofileのストロングパラメータを追加
   devise_parameter_sanitizer.permit(:account_update, keys: [:user_image, :user_name, :user_introduction])
  end

 end
