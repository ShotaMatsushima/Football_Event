class Event < ApplicationRecord
  # アソシエーション
  belongs_to :user
  has_many :participations
  has_many :likes
  # 画像アップロード
  mount_uploader :image, ImageUploader
  # カラムのvalidation
  validates :user_id, presence: true
  validates :name, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :start_at, presence: true
  validates :end_at, presence: true
  validates :event_team, presence: true
  validates :capacity, presence: true, :numericality => { :greater_than_or_equal_to => 2 }
  validates :image, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :title, presence: true

  # バリデーションの前に送信されたaddressの値によってジオコーディング(緯度経度の算出)を行う
  geocoded_by :address
  before_validation :geocode

  def participated_by?(user)
    participations.where(user_id: user.id).exists?
  end

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end
