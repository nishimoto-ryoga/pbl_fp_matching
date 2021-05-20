class ReservationFrame < ApplicationRecord
  belongs_to :planner
  belongs_to :time_frame

  validates :date, presence: true

end
