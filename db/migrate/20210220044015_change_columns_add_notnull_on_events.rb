class ChangeColumnsAddNotnullOnEvents < ActiveRecord::Migration[5.2]
  def change
    change_column :events, :event_name, :string, null: false, default: ""
    change_column :events, :description, :text, null: false
    change_column :events, :event_address, :string, null: false, default: ""
    change_column :events, :event_team, :string, null: false, default: ""
  end
end
