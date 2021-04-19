class AddcolumnActionNotifications < ActiveRecord::Migration[5.2]
  def change
    add_column :notifications, :action, :integer, null: false
  end
end
