class Event < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :event_name, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :event_address, presence: true
  validates :event_at, presence: true
  validates :event_team, presence: true
  validates :capacity, presence: true
end
