class Triangle

  def initialize(sides)
    @sides = sides
  end

  def equilateral?()
    return (valid? and
      @sides[0] == @sides[1] and @sides[0] == @sides[2])
  end
  
  def isosceles?()
    return (valid? and
      (@sides[0] == @sides[1] or @sides[0] == @sides[2] or @sides[1] == @sides[2]))
  end
  
  def scalene?()
    return (valid? and !equilateral? and !isosceles?)
  end
  
  def valid?()
    if @sides[0] == 0 or @sides[1] == 0 or @sides[2] == 0
      return false
    end
    if @sides[0] >= @sides[1] + @sides[2] or
      @sides[1] >= @sides[0] + @sides[2] or
      @sides[2] >= @sides[0] + @sides[1]
      return false
    end
    return true
  end
  
end

module BookKeeping
  VERSION = 1
end