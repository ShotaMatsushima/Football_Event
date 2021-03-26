class RenameColumnToEvents < ActiveRecord::Migration[5.2]
  def change
    rename_column :events, :event_name, :name
    rename_column :events, :event_start_at, :start_at
    rename_column :events, :event_end_at, :end_at
  end
end
