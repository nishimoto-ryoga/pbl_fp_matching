class ChangeColumnTimeFrame < ActiveRecord::Migration[6.1]
  def up
    change_column :time_frames, :start_at, :string, :null => false
    change_column :time_frames, :end_at, :string, :null => false
  end
end
