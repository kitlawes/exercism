class SumOfMultiples

  def initialize(*factors)
    @factors = *factors
  end
  
  def to(number)
    sum = 0
    for i in 1..(number - 1)
      @factors.each do |factor|
        if i % factor == 0
          sum += i
          break
        end
      end
    end
    return sum
  end
  
end