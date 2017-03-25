class Game

  class BowlingError < StandardError
  end

  def initialize()
    @rolls = []
  end
  
  def roll(pins)
    @rolls.push(pins)
  end
  
  def score()
  
    score = 0
    frame = 1
    i = 0
    max_length = 0
    while frame <= 10 do
    
      if i > @rolls.length - 1
        raise BowlingError
      end
      
      if @rolls[i].to_i == 10
      
        if i + 2 > @rolls.length - 1
          raise BowlingError
        end
      
        if @rolls[i + 1].to_i > 10 or
          @rolls[i + 1].to_i < 0 or
          @rolls[i + 2].to_i > 10 or
          @rolls[i + 2].to_i < 0
          raise BowlingError
        end
        if @rolls[i + 1].to_i < 10 and
          @rolls[i + 1].to_i + @rolls[i + 2].to_i > 10
          raise BowlingError
        end
        
        score += 10 + @rolls[i + 1].to_i + @rolls[i + 2].to_i
        max_length = i + 3
        
      else
      
        if i + 1 > @rolls.length - 1
          raise BowlingError
        end
      
        if @rolls[i].to_i > 10 or
          @rolls[i].to_i < 0 or
          @rolls[i].to_i + @rolls[i + 1].to_i > 10 or
          @rolls[i + 1].to_i < 0
          raise BowlingError
        end
      
        score += @rolls[i].to_i + @rolls[i + 1].to_i
        max_length = i + 2
        
        if @rolls[i].to_i + @rolls[i + 1].to_i == 10
        
          if i + 2 > @rolls.length - 1
            raise BowlingError
          end
        
          if @rolls[i + 2].to_i > 10 or
            @rolls[i + 2].to_i < 0
            raise BowlingError
          end
        
          score += @rolls[i + 2].to_i
          max_length = i + 3
          
        end
        
        i += 1
        
      end
      frame += 1
      i += 1
      
    end
    
    if max_length < @rolls.length
      raise BowlingError
    end
    
    return score
    
  end
  
end

module BookKeeping
  VERSION = 3
end