class CreateTimeFrames < ActiveRecord::Migration[6.1]
  def change
    create_table :time_frames do |t|
      t.time :start_at
      t.time :end_at
      
      t.timestamps
    end
  end
end
