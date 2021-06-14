class ReservationFrame < ApplicationRecord
  belongs_to :planner
  belongs_to :time_frame
  has_one :reservation, dependent: :restrict_with_exception

  validates :date, presence: true, uniqueness: { scope: %i[time_frame_id planner] }
  scope :not_canceled, -> { where(canceled_at: nil) }

  validate :the_reservation_on_sunday_is_denied
  validate :saturday_is_shorttime
  validate :the_date_in_the_past_or_over_a_year_after_today_is_invalid

  def reserved?
    reservation.present?
  end

  def canceled?
    canceled_at?
  end

  def the_reservation_on_sunday_is_denied
    return if date.nil?
    return unless date.sunday?

    errors.add(:date, '日曜日はゆっくり過ごしましょう。')
  end

  def saturday_is_shorttime
    return if date.nil? || time_frame_id.nil?
    return unless date.wday == 6

    start_at = TimeString.new(time_frame.start_at)
    return if TimeString.new('11:00') <= start_at && start_at <= TimeString.new('15:00')

    errors.add(:date, '土曜日は11時〜15時の間で指定してください。')
  end

  def the_date_in_the_past_or_over_a_year_after_today_is_invalid
    return if date.nil?
    return unless date <= Time.zone.today || date > Time.zone.today.since(1.year)

    errors.add(:date, '明日以降かつ1年以内で設定してください。')
  end
end
