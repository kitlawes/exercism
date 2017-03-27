class Say

  def initialize(question)
    @question = question
    @translation = {
      0 => "zero",
      1 => "one",
      2 => "two",
      3 => "three",
      4 => "four",
      5 => "five",
      6 => "six",
      7 => "seven",
      8 => "eight",
      9 => "nine",
      10 => "ten",
      11 => "eleven",
      12 => "twelve",
      13 => "thirteen",
      14 => "fourteen",
      15 => "fifteen",
      16 => "sixteen",
      17 => "seventeen",
      18 => "eighteen",
      19 => "nineteen",
      20 => "twenty",
      30 => "thirty",
      40 => "forty",
      50 => "fifty",
      60 => "sixty",
      70 => "seventy",
      80 => "eighty",
      90 => "ninety",
      100 => "hundred",
      1000 => "thousand",
      1000000 => "million",
      1000000000 => "billion"
    }
  end
  
  def in_english()
  
    if @question < 0 or @question > 999999999999
      raise ArgumentError
    end
    
    if @question == 0
      return @translation[0]
    end
  
    return translate(@question, Math.log10(@question).to_i + 1)
  
  end
  
  def translate(number, digits)
  
    if digits == 1
      return @translation[number].to_s
    end
  
    if digits == 2
      
      if number >= 10 and number <= 19
        return @translation[number]
      end
      
      translation = ""
      if number / 10 != 0
        translation += @translation[number / 10 * 10].to_s
        if number % 10 != 0
          translation += "-"
        end
      end
      if number % 10 != 0
        translation += translate(number % 10, 1)
      end
      return translation
      
    end
    
    if digits == 3
      divisor = 100
      digits_after_division = 1
      digits_after_modulus = 2
    else
      divisor = 1000 ** ((digits - 1) / 3)
      digits_after_division = (digits % 3) == 0 ? 3 : (digits % 3)
      digits_after_modulus = ((digits - 1) / 3) * 3
    end
    translation = ""
    if number / divisor != 0
      translation += translate(number / divisor, digits_after_division) + " " + @translation[divisor].to_s
      if number % divisor != 0
        translation += " "
      end
    end
    if number % divisor != 0
      translation += translate(number % divisor, digits_after_modulus)
    end
    return translation
    
  end
  
end

module BookKeeping
  VERSION = 1
end