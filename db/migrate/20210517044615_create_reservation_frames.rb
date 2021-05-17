class CreateReservationFrames < ActiveRecord::Migration[6.1]
  def change
    create_table :reservation_frames do |t|
      t.date :date
      t.boolean :is_deleted
      t.references :planner, null: false, foreign_key: true
      t.references :time_frame, null: false, foreign_key: true

      t.timestamps
    end
  end
end
