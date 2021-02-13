class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :event_name
      t.text :description
      t.string :event_address
      t.datetime :event_at
      t.string :event_team
      t.integer :capacity
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :events, [:user_id, :created_at]
  end
end
