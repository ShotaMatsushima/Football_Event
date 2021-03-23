class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :event
  has_many :notifications, dependent: :destroy
  validates :content, presence: true, length: { maximum: 140 }
  validates :user_id, presence: true
  validates :event_id, presence: true
end
