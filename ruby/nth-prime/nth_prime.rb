class Prime
  def self.nth(n)
  
    if n <= 0
      raise ArgumentError
    end
    
    i = 1
    j = 2
    while true
      isPrime = true
      for k in 2..Math.sqrt(j)
        if j % k == 0
          isPrime = false
          break
        end
      end
      if isPrime
        if i == n
          return j
        end
        i += 1
      end
      j += 1
    end
    
  end
end

module BookKeeping
  VERSION = 1
end