class Trinary

  def initialize(trinary)
    @trinary = trinary
  end
  
  def to_decimal()
  
    if @trinary =~ /[^0-2]/
      return 0
    end
  
    decimal = 0
    multiplier = 3 ** (@trinary.length - 1)
    @trinary.split("").each do |digit|
      decimal += digit.to_i * multiplier
      multiplier /= 3
    end
    return decimal
    
  end
  
end

module BookKeeping
  VERSION = 1
end