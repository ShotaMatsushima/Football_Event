class Relationship < ApplicationRecord
  belongs_to :following, class_name: "User"
  belongs_to :follower, class_name: "User"
  validates :following_id, presence: true
  validates :follower_id, presence: true
  validates_uniqueness_of :following_id, scope: :follower_id
end
