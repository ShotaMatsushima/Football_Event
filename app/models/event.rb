class Event < ApplicationRecord
  # アソシエーション
  belongs_to :user
  has_many :participations
  has_many :likes
  has_many :comments
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

  def create_notification_like!(current_user)
    # すでに「いいね」されているか検索
    temp = Notification.where(["visiter_id = ? and visited_id = ? and event_id = ? and action = ? ", current_user.id, user_id, id, 'like'])
    # いいねされていない場合のみ、通知レコードを作成
    if temp.blank?
      notification = current_user.active_notifications.new(
        event_id: id,
        visited_id: user_id,
        action: 'like'
      )
      # 自分の投稿に対するいいねの場合は、通知済みとする
      if notification.visiter_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
  end

  def create_notification_comment!(current_user, comment_id)
    # 自分以外にコメントしている人をすべて取得し、全員に通知を送る
    temp_ids = Comment.select(:user_id).where(event_id: id).where.not(user_id: current_user.id).distinct
    temp_ids.each do |temp_id|
        save_notification_comment!(current_user, comment_id, temp_id['user_id'])
    end
    # まだ誰もコメントしていない場合は、投稿者に通知を送る
    save_notification_comment!(current_user, comment_id, user_id) if temp_ids.blank?
  end

  def save_notification_comment!(current_user, comment_id, visited_id)
    # コメントは複数回することが考えられるため、１つの投稿に複数回通知する
    notification = current_user.active_notifications.new(
      event_id: id,
      comment_id: comment_id,
      visited_id: visited_id,
      action: 'comment'
    )
    # 自分の投稿に対するコメントの場合は、通知済みとする
    if notification.visiter_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end

  def create_notification_participation!(current_user)
    # すでに参加しているか検索
    temp = Notification.where(["visiter_id = ? and visited_id = ? and event_id = ? and action = ? ", current_user.id, user_id, id, 'participation'])
    # 参加していない場合のみ、通知レコードを作成
    if temp.blank?
      notification = current_user.active_notifications.new(
        event_id: id,
        visited_id: user_id,
        action: 'participation'
      )
    end
  end
end
