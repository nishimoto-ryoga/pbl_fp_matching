class AddIndexColumnToReservationFrames < ActiveRecord::Migration[6.1]
  def up
    add_index  :reservation_frames, [:date, :planner_id, :time_frame_id], unique: true, name: "reservation_frames_index"
  end

  def down
    remove_index  :reservation_frames, name: :reservation_frames_index
  end
end
