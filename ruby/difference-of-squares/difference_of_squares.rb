class Squares

  def initialize(number)
    @number = number
  end

  def square_of_sum()
    sum = 0
    for i in 1..@number
      sum += i
    end
    return sum ** 2
  end

  def sum_of_squares()
    sum = 0
    for i in 1..@number
      sum += i ** 2
    end
    return sum
  end

  def difference()
    return self.square_of_sum - self.sum_of_squares
  end
  
end

module BookKeeping
  VERSION = 3
end