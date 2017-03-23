class Grains

  def self.square(square)
    
    if square < 1 || square > 64
      raise ArgumentError
    end
    
    grains = 1
    for i in 2..square
      grains *= 2
    end
    return grains
    
  end
  
  def self.total()
    grains = 0
    for i in 1..64
      grains += self.square(i)
    end
    return grains
  end
  
end

module BookKeeping
  VERSION = 1
end