class Luhn

  def initialize(string)
    @string = string.to_s.gsub(/[ _]/, "")
  end
  
  def addends
    array = []
    numbers = @string.split("")
    for i in 0..(numbers.length - 1)
      number = numbers[i].to_i
      if (numbers.length - i).even?
        number = number * 2
        if number > 9
          number -= 9
        end
      end
      array.push(number)
    end
    return array
  end
  
  def checksum
    array = addends
    checksum = 0
    for i in 0..(array.length - 1)
      checksum += array[i]
    end
    return checksum
  end
  
  def valid?
    return checksum % 10 == 0
  end
  
  def self.create(string)
    luhn = self.new(string.to_s + "0")
    remainder = luhn.checksum % 10
    return (string.to_s + ((10 - remainder) % 10).to_s).to_i
  end
  
end