class DeleteIndexToUser < ActiveRecord::Migration[5.2]
  def change
    remove_index :users, :favorite_team
  end
end
