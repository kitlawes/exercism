class Meetup

  def initialize(month, year)
    @month = month
    @year = year
  end
  
  def day(weekday, schedule)
    date = Date.new(@year, @month, 1)
    count = 0
    while true do
      if date.strftime('%A').downcase.to_sym == weekday
        count += 1
        if schedule == :teenth and date.day >= 13
          break
        end
        if schedule == :first
          break
        end
        if schedule == :second and count == 2
          break
        end
        if schedule == :third and count == 3
          break
        end
        if schedule == :fourth and count == 4
          break
        end
        if schedule == :last and date.month != @month
          date -= 7
          break
        end
      end
      date += 1
    end
    return date
  end
  
end

module BookKeeping
  VERSION = 1
end