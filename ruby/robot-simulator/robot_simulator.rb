class Robot
  
  def initialize()
    @directions = [:north, :east, :south, :west]
  end
  
  def orient(direction)
    if @directions.include?(direction)
      @direction = direction
    else
      throw ArgumentError
    end
  end
  
  def bearing
  	return @direction
  end
  
  def turn_right
  	@direction = @directions[(@directions.index(@direction) + 1) % @directions.length]
  end
  
  def turn_left
  	@direction = @directions[(@directions.index(@direction) - 1) % @directions.length]
  end
  
  def at(x, y)
  	@x = x
  	@y = y
  end
  
  def coordinates
  	return [@x, @y]
  end
  
  def advance
  	if @direction == :north
      @y += 1
  	elsif @direction == :east
      @x += 1
  	elsif @direction == :south
      @y -= 1
  	elsif @direction == :west
      @x -= 1
  	end
  end
  
end

class Simulator
  
  def initialize()
    @instructions_to_symbols = {
        'L' => :turn_left,
        'R' => :turn_right,
        'A' => :advance,
      }
  end
  
  def instructions(character_instructions)
    symbol_instructions = []
    character_instructions.split("").each do |character_instruction|
      symbol_instructions.push(@instructions_to_symbols[character_instruction])
    end
    return symbol_instructions
  end
  
  def place(robot, arguments)
    robot.at(arguments[:x], arguments[:y])
    robot.orient(arguments[:direction])
  end
  
  def evaluate(robot, character_instructions)
    symbol_instructions = instructions(character_instructions)
    symbol_instructions.each do |symbol_instruction|
      robot.send(symbol_instruction)
    end
  end
  
end