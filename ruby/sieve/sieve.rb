class Sieve

  def initialize(number)
    @number = number
  end

  def primes()
    primes = []
    for i in 2..@number
      prime = true
      for j in 2..Math.sqrt(i)
        if i % j == 0
          prime = false
          break
        end
      end
      if prime
        primes.push(i)
      end
    end
    return primes
  end
  
end

module BookKeeping
  VERSION = 1
end