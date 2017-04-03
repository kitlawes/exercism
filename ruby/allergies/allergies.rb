class Allergies

  def initialize(allergy_score)
    @allergy_score = allergy_score
    @allergies = [
      "eggs",
      "peanuts",
      "shellfish",
      "strawberries",
      "tomatoes",
      "chocolate",
      "pollen",
      "cats"
    ]
  end
  
  def allergic_to?(allergy)
    return list.include?(allergy)
  end
  
  def list
  
    decimal = @allergy_score
    binary = ""
    while decimal > 0
      if decimal.even?
        binary += "0"
      else
        binary += "1"
      end
      decimal /= 2
    end
    
    binary_array = binary.split("")
    list = []
    i = 0
    while i < @allergies.length
      if binary_array[i] == "1"
        list.push(@allergies[i])
      end
      i += 1
    end
    return list
    
  end
  
end