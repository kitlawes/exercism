class Binary
  def self.to_decimal(binary)
    decimal = 0
    increment = 2 ** (binary.length - 1)
    for i in 0..(binary.length - 1)
      if binary[i] !~ /[01]/
        raise ArgumentError
      end
      if binary[i] == 1.to_s
        decimal += increment
      end
      increment /= 2
    end
    return decimal
  end
end

module BookKeeping
  VERSION = 3
end