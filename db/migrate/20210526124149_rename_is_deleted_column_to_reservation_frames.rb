class RenameIsDeletedColumnToReservationFrames < ActiveRecord::Migration[6.1]
  def up
    rename_column :reservation_frames, :is_deleted, :canceled_at
    change_column :reservation_frames, :canceled_at, :datetime, :default => nil, :null =>  true
  end

  def down
    rename_column :reservation_frames, :canceled_at, :is_deleted
  end
  
end
