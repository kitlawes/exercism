class Robot

  @@names = []
  
  def initialize()
    self.reset()
  end

  def name()
    return @name
  end

  def reset()
  
    if @name != NIL
      @@names.delete(@name)
    end
    
    letters = []
    for letter in "A".."Z"
      letters.push(letter)
    end
    loop do
      @name = letters[rand(26)] + letters[rand(26)] + rand(10).to_s + rand(10).to_s + rand(10).to_s
      break if !@@names.include? @name
    end
    
    @@names.push(@name)
    
  end
  
end

module BookKeeping
  VERSION = 2
end