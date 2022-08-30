class Room < ApplicationRecord
  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, numericality: true
  validates :address, presence: true
  validates :image,presence: true

  #画像アップロード
  mount_uploader :image, ImageUploader
  has_many_attached :images
  #予約機能
  has_many :reservations
end
