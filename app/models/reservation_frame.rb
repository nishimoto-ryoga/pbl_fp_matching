class ReservationFrame < ApplicationRecord
  belongs_to :planner
  belongs_to :time_frame
  has_one :reservations, dependent: :restrict_with_exception

  validates :date, presence: true

end
