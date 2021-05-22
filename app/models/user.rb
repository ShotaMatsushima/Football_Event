class User < ApplicationRecord
  # デバイスの設定
  devise :database_authenticatable, :registerable, :recoverable, :rememberable
  # アソシエーション
  has_many :events
  has_many :participations
  has_many :participaton_events, through: :participations, source: :event
  has_many :likes
  has_many :comments
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visiter_id'
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id'
  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
  has_many :followings, through: :active_relationships, source: :follower
  has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
  has_many :followers, through: :passive_relationships, source: :following
  # カラムのvalidation
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
  validates :favorite_team, presence: true
  validates :user_address, presence: true
  validates :password, presence: true, on: :create, length: { minimum: 6 }
  def self.guest
    find_by!(email: 'testuser@gmail.com') do |user|
      user.password = 123456
    end
  end

  def followed_by?(user)
    passive_relationships.find_by(following_id: user.id).present?
  end
end
