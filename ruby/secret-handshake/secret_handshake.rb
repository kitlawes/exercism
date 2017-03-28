class SecretHandshake

  def initialize(decimal)
    @decimal = decimal
  end
  
  def commands()
  
#    binary = ""
#    decimal = @decimal
#    power_of_2 = 2 ** Math.log2(@decimal).floor
#    for i in 1..Math.log2(@decimal).ceil
#      binary += (decimal / power_of_2).to_s
#      decimal %= power_of_2
#      power_of_2 /= 2
#    end
    
    if @decimal =~ /[a-z]/
      return []
    end
    
    operations = {
      "wink" => 0,
      "double blink" => 1,
      "close your eyes" => 2,
      "jump" => 3
    }
    commands = []
    operations.keys.each do |key|
      if @decimal / 2 ** operations[key] % 2 >= 1
        commands.push(key)
      end
    end
    if @decimal / 2 ** 4 % 2 >= 1
      commands = commands.reverse
    end
    return commands
    
  end
  
end