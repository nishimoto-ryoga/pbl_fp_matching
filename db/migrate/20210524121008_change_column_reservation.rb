class ChangeColumnReservation < ActiveRecord::Migration[6.1]
  def up
    add_index :reservations, %i[client_id reservation_frame_id], unique: true
  end
end
