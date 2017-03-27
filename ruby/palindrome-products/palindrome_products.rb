class Palindromes

  def initialize(factors)
    @max_factor = factors[:max_factor]
    if factors.key?(:min_factor)
      @min_factor = factors[:min_factor]
    else
      @min_factor = 1
    end
  end
  
  def generate()
    @palindromes = []
    for i in @min_factor..@max_factor
      for j in @min_factor..@max_factor
        if (i * j).to_s == (i * j).to_s.reverse
          if @palindromes.any?{|palindrome| palindrome.value == i * j}
            palindrome = @palindromes.find{|palindrome| palindrome.value == i * j}
            if !palindrome.factors.any?{|factors| factors[0] == i or factors[0] == j}
              palindrome.factors.push([i, j])
            end
          else
            palindrome = Palindrome.new()
            palindrome.value = i * j
            palindrome.factors.push([i, j])
            @palindromes.push(palindrome)
          end
        end
      end
    end
  end
  
  def largest()
    largest = @palindromes[0]
    @palindromes.each do |palindrome|
      if palindrome.value > largest.value
        largest = palindrome
      end
    end
    return largest
  end
  
  def smallest()
    smallest = @palindromes[0]
    @palindromes.each do |palindrome|
      if palindrome.value < smallest.value
        smallest = palindrome
      end
    end
    return smallest
  end
  
end

class Palindrome

  def initialize()
    @factors = []
  end

  def value
    return @value
  end

  def factors
    return @factors
  end

  def value=(value)
    @value = value
  end

  def factors=(factors)
    @factors = factors
  end
  
end

module BookKeeping
  VERSION = 2
end