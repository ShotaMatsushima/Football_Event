class RenameAddressColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :address, :user_address
  end
end
