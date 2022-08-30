class UsersController < ApplicationController
 before_action :authenticate_user!, except: [:show, :index]

  def profile
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
    flash[:notice] = "プロフィールを更新しました"
    redirect_to action: :profile
    end
  end

  def account
    @user = current_user
  end

  private
  def user_params
    params.require(:user).permit(:user_image, :user_name, :user_introduction)
  end

  protected
  def update_resource(resource, params)
    resource.update_without_current_password(params)
  end

end
