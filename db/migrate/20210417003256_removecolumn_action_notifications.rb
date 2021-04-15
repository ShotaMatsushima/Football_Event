class RemovecolumnActionNotifications < ActiveRecord::Migration[5.2]
  def change
    remove_column :notifications, :action, :string
  end
end
