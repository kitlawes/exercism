class Series

  def initialize(input)
    @input = input
  end

  def largest_product(digits)
  
    if digits > @input.length || digits < 0
      raise ArgumentError
    end
    
    largest_product = 0
    for i in (digits - 1)..(@input.length - 1)
      product = 1
      for j in (i - digits + 1)..i
        if @input[j] =~ /[^0-9]/
          raise ArgumentError
        end
        product *= @input[j].to_i
      end
      largest_product = [largest_product, product].max
    end
    return largest_product
    
  end
  
end

module BookKeeping
  VERSION = 2
end