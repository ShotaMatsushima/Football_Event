class RenameEventAddressColumnToEvents < ActiveRecord::Migration[5.2]
  def change
    rename_column :events, :event_address, :address
  end
end
