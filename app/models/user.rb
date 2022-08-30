class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

 #新規登録バリデーション
 validates :user_name, presence: true
 validates :email, presence: true
 validates :password, presence: true, on: :create
 validates :password_confirmation, presence: true, on: :create

 devise :database_authenticatable, :registerable,
        :recoverable, :rememberable

 #予約機能
 has_many :reservations, dependent: :destroy
 has_many :rooms

 #画像アップロード
 mount_uploader :user_image, ImageUploader

 def update_with_password(params, *options)
    params.delete(:current_password)

    if params[:password].blank?
        params.delete(:password)
        params.delete(:password_confirmation) if params[:password_confirmation].blank?
    end

    result = update(params, *options)

    clean_up_passwords
    result
  end
end
