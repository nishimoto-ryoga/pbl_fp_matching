class ReservationFrame < ApplicationRecord
  belongs_to :planner
  belongs_to :time_frame
  has_one :reservation, dependent: :restrict_with_exception

  validates :date, presence: true

  scope :not_canceled, -> { where(canceled_at: nil) }

  def reserved?
    reservation.present?
  end

  def canceled?
    self.canceled_at.present?
  end
  
end
