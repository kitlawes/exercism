class PhoneNumber

  def initialize(number)
    if number.length == 11 and number.start_with?("1")
      number = number[1, 10]
    end
    @number = number.gsub(/[()-. ]/,"")
  end
  
  def number()
    if @number =~ /[^0-9]/ or (@number.length != 10 and (@number.length != 11 or @number[10] != "1"))
      return "0000000000"
    end
    return @number
  end
  
  def area_code()
    return @number[0, 3]
  end
  
  def to_s()
    return "(" + @number[0, 3] + ") " + @number[3, 3] + "-" + @number[6, 4]
  end
  
end