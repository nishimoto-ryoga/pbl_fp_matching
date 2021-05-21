class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.references :client, null: false, foreign_key: true
      t.references :reservtion_frame, null: false, foreign_key: true

      t.timestamps
    end
  end
end
