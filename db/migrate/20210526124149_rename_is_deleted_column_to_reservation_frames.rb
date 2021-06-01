class RenameIsDeletedColumnToReservationFrames < ActiveRecord::Migration[6.1]
  def up
    remove_column :reservation_frames, :is_deleted
    add_column :reservation_frames, :canceled_at, :datetime, default: nil, null: true
  end

  def down
    remove_column :reservation_frames, :canceled_at
    add_column :reservation_frames, :is_deleted, :boolean, default: false, null: false
  end
end
