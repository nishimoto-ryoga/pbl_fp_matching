class ReservationFrame < ApplicationRecord
  belongs_to :planner
  belongs_to :time_frame
  has_one :reservations, dependent: :restrict_with_exception

  validates :date, presence: true

  scope :is_deleted, -> { where(:is_deleted => false) }

  def is_reserved(reservation_frame_id)
    return Reservation.exists?(reservation_frame_id: reservation_frame_id)
  end
end
