class Clock

  def initialize()
    @hours = 0
    @minutes = 0
  end
  
  def self.at(hours, minutes)
    clock = Clock.new
    clock.set_hours(hours)
    clock.set_minutes(minutes)
    clock.normalize
    return clock
  end
  
  def to_s()
    return format('%02d:%02d', @hours, @minutes)
  end
  
  def +(minutes)
    @minutes += minutes
    normalize
    return self
  end
  
  def ==(clock)
    return (@hours == clock.get_hours and @minutes == clock.get_minutes)
  end
  
  def normalize()
    @hours = @hours + @minutes / 60
    @hours = @hours % 24
    @minutes = @minutes % 60
  end
  
  def get_hours()
    return @hours
  end
  
  def get_minutes()
    return @minutes
  end
  
  def set_hours(hours)
    @hours = hours
  end
  
  def set_minutes(minutes)
    @minutes = minutes
  end
  
end

module BookKeeping
  VERSION = 2
end