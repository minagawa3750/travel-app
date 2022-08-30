class Reservation < ApplicationRecord
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :member, numericality: true

  mount_uploader :image, ImageUploader
  belongs_to :user
  belongs_to :room
end
