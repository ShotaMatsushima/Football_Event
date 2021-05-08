class ChangeColumnToNulls < ActiveRecord::Migration[5.2]
  def up
    change_column_null :events, :start_at, false
    change_column_null :events, :end_at, false
    change_column_null :events, :capacity, false
    change_column_null :events, :user_id, false
    change_column_null :events, :title, false
  end

  def down
    change_column_null :events, :start_at, true
    change_column_null :events, :end_at, true
    change_column_null :events, :capacity, true
    change_column_null :events, :user_id, true
    change_column_null :events, :title, true
  end
end
