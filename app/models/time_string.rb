class TimeString
  include Comparable
  attr_reader :time_str

  def initialize(time_str)
    today = Time.zone.today
    @time_str = Time.zone.parse("#{today} #{time_str}")
  end

  def <=>(other)
    time_str <=> other.time_str
  end
end
