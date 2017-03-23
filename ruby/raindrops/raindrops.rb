class Raindrops
  def self.convert(number)
    output = ""
    if number % 3 == 0
      output += "Pling"
    end
    if number % 5 == 0
      output += "Plang"
    end
    if number % 7 == 0
      output += "Plong"
    end
    if output == ""
      output += number.to_s
    end
    return output
  end
end

module BookKeeping
  VERSION = 3
end