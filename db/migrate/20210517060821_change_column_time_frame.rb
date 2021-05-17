class ChangeColumnTimeFrame < ActiveRecord::Migration[6.1]
  def change
    change_column :time_frames, :start_at, :string
    change_column :time_frames, :end_at, :string
  end
end
