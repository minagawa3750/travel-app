class Reservation < ApplicationRecord
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :member, numericality: {greater_than_or_equal_to: 0}
  validate :date_before_start
  validate :date_before_finish

  def date_before_start
    return if start_date.blank?
    errors.add(:start_date, "は今日以降のものを選択してください") if start_date < Date.today
  end

  def date_before_finish
    return if end_date.blank? || start_date.blank?
    errors.add(:end_date, "は開始日以降のものを選択してください") if end_date < start_date
  end

  mount_uploader :image, ImageUploader
  belongs_to :user
  belongs_to :room
end
