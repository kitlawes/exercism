class Hexadecimal

  def initialize(hexadecimal)
    @hexadecimal = hexadecimal
  end
  
  def to_decimal()
    decimal = 0
    multiplier = 16 ** (@hexadecimal.length - 1)
    @hexadecimal.split("").each do |digit|
      if digit =~ /[a-f]/
        converted_digit = digit.ord - 87
      elsif digit =~ /[e-z]/
        return 0
      else
        converted_digit = digit
      end
      decimal += converted_digit.to_i * multiplier
      multiplier /= 16
    end
    return decimal
  end
  
end