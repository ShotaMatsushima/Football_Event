class A < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :latitude, :float, null: false
    add_column :events, :longitude, :float, null: false
    add_column :events, :title, :text
  end
end
