class AddEventEndAtToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :event_end_at, :datetime
  end
end
