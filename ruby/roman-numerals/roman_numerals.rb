class Integer

  def to_roman()
    
    digit = self % 10
    roman_numerals = self.get_digit_numerals(digit, ["I", "V", "X"])
    
    if self >= 10
      digit = (self / 10) % 10
      roman_numerals = self.get_digit_numerals(digit, ["X", "L", "C"]) + roman_numerals
    end
    
    if self >= 10 ** 2
      digit = (self / 10 ** 2) % 10
      roman_numerals = self.get_digit_numerals(digit, ["C", "D", "M"]) + roman_numerals
    end
    
    if self >= 10 ** 3
      digit = (self / 10 ** 3) % 10
      roman_numerals = self.get_digit_numerals(digit, ["M", "", ""]) + roman_numerals
    end
    
    return roman_numerals
    
  end
  
  def get_digit_numerals(digit, roman_numerals)
    case digit
    when 0
      return ""
    when 1
      return roman_numerals[0]
    when 2
      return roman_numerals[0] + roman_numerals[0]
    when 3
      return roman_numerals[0] + roman_numerals[0] + roman_numerals[0]
    when 4
      return roman_numerals[0] + roman_numerals[1]
    when 5
      return roman_numerals[1]
    when 6
      return roman_numerals[1] + roman_numerals[0]
    when 7
      return roman_numerals[1] + roman_numerals[0] + roman_numerals[0]
    when 8
      return roman_numerals[1] + roman_numerals[0] + roman_numerals[0] + roman_numerals[0]
    when 9
      return roman_numerals[0] + roman_numerals[2]
    end
  end
  
end

module BookKeeping
  VERSION = 2
end