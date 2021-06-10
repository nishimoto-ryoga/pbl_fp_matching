class TimeString
  include Comparable

  def self.compare(time_str)
    time_str.between?('11:00', '15:00')
  end
end
