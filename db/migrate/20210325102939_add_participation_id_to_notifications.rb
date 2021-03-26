class AddParticipationIdToNotifications < ActiveRecord::Migration[5.2]
  def change
    add_column :notifications, :participation_id, :integer
    add_index :notifications, :participation_id
  end
end
