class Queens

  def initialize(pieces)
    if pieces[:white][0].to_i < 0 or pieces[:white][0].to_i > 7 or pieces[:white][1].to_i < 0 or pieces[:white][1].to_i > 7
      raise ArgumentError
    end
    @white = pieces[:white]
    @black = pieces[:black]
  end
  
  def attack?()
    return (@white[0] == @black[0] or
      @white[1] == @black[1] or
      @white[0] - @white[1] == @black[0] - @black[1] or
      @white[0] + @white[1] == @black[0] + @black[1])
  end
  
end

module BookKeeping
  VERSION = 2
end