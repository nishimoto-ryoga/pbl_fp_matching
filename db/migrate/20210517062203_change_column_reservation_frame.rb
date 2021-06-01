class ChangeColumnReservationFrame < ActiveRecord::Migration[6.1]
  def up
    change_column :reservation_frames, :is_deleted, :boolean, default: false, null: false
  end
end
