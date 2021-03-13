class User < ApplicationRecord
  # デバイスの設定
  devise :database_authenticatable, :registerable, :recoverable, :rememberable
  # アソシエーション
  has_many :events, dependent: :destroy
  has_many :participations, dependent: :destroy
  has_many :participaton_events, through: :participations, source: :event
  has_many :likes, dependent: :destroy
  # カラムのvalidation
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
  validates :favorite_team, presence: true
  validates :user_address, presence: true
  validates :password, presence: true, length: { minimum: 6 }
end
