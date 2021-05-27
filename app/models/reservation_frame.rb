class ReservationFrame < ApplicationRecord
  belongs_to :planner
  belongs_to :time_frame
  has_one :reservation, dependent: :restrict_with_exception

  validates :date, presence: true

  scope :not_canceled, -> { where(canceled_at: nil) }

  def is_reserved?
    reservation.present?
  end
end
