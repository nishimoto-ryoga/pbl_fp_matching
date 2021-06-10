class CompareTime
  def compare(time_frame)
    today_str = Time.zone.today
    start_at = Time.zone.parse("#{today_str} #{time_frame.start_at}")
    time1 = Time.zone.parse("#{today_str} 11:00")
    time2 = Time.zone.parse("#{today_str} 15:00")
    start_at.between?(time1, time2)
  end
end
