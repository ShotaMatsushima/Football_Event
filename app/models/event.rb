class Event < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader
  validates :user_id, presence: true
  validates :event_name, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :event_start_at, presence: true
  validates :event_end_at, presence: true
  validates :event_team, presence: true
  validates :capacity, presence: true, :numericality => { :greater_than_or_equal_to => 2 }
  validates :image, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :title, presence: true

  # バリデーションの前に送信されたaddressの値によってジオコーディング(緯度経度の算出)を行う
  geocoded_by :address
  before_validation :geocode
end
