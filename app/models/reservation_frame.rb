class ReservationFrame < ApplicationRecord
  belongs_to :planner
  belongs_to :time_frame
  has_one :reservation, dependent: :restrict_with_exception

  validates :date, presence: true, uniqueness: { scope: %i[time_frame_id planner] }
  scope :not_canceled, -> { where(canceled_at: nil) }

  validate :sunday_is_closed, :saturday_is_shorttime, :invalid_of_date, on: :create

  def reserved?
    reservation.present?
  end

  def canceled?
    canceled_at?
  end

  def sunday_is_closed
    return unless date.wday.zero?

    errors.add(:date, '：日曜日はゆっくり過ごしましょう。')
  end

  def saturday_is_shorttime
    return unless date.wday == 6 && !time_frame_id.between?(3, 11)

    errors.add(:date, '：土曜日は11時〜15時の間で指定してください。')
  end

  def invalid_of_date
    return unless date <= Time.zone.today || date > Time.zone.today.since(1.year)

    errors.add(:date, '：明日以降かつ1年以内で設定してください。')
  end
end
