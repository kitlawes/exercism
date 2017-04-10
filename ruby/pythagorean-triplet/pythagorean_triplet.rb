class Triplet
  
  def initialize(first_number, second_number, third_number)
    @first_number = first_number
    @second_number = second_number
    @third_number = third_number
  end
  
  def sum
  	return @first_number + @second_number + @third_number
  end
  
  def product
  	return @first_number * @second_number * @third_number
  end
  
  def pythagorean?
  	return @first_number ** 2 + @second_number ** 2 == @third_number ** 2
  end
  
  def self.where(arguments)
  
    if arguments[:min_factor].nil?
      arguments[:min_factor] = 1
    end
    
    triplets = []
    for i in arguments[:min_factor]..arguments[:max_factor]
      for j in i..arguments[:max_factor]
        for k in j..arguments[:max_factor]
          triplet = Triplet.new(i, j, k)
          if triplet.pythagorean? and (arguments[:sum].nil? or arguments[:sum] == triplet.sum)
            triplets.push(triplet)
          end
        end
      end
    end
  	return triplets
  	
  end
  
end