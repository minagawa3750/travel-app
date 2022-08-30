# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  #before_action :authenticate_user!
  # GET /resource/sign_in
   #def new
    # binding.pry
     #@user = current_user.id
   #end
   def create
     @user = login(params[:email], params[:password])
     if @user
       redirect_back_or_to root_path, success: 'ログインしました'
     else
       flash[:danger] = 'ログインに失敗しました'
       render :new
     end
   end
  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
