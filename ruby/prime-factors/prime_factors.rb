class PrimeFactors
  def self.for(number)
    
    if number == 1
      return []
    end
    
    for i in 2..(number / 2)
      if number % i == 0
        return self.for(i).concat(self.for(number / i))
      end
    end
    
    return [number]
    
  end
end