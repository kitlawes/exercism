class Alphametics

  def self.solve(input)
    
    operands = input[0, input.index(" == ")].gsub(" + ", " ").split(" ")
    sum = input[input.index(" == ") + " == ".length, input.length]
    
    letters = []
    operands.each do |operand|
      operand.split("").each do |letter|
        if !letters.include?(letter)
          letters.push(letter)
        end
      end
    end
    sum.split("").each do |letter|
      if !letters.include?(letter)
        letters.push(letter)
      end
    end
    
    numbers = *(0..9)
    hash = {}
    
    solution_found = self.assign_number_to_letter(input, letters, numbers, hash)
    
    return hash
    
  end
  
  def self.assign_number_to_letter(input, letters, numbers, hash)
  
    if letters.empty?
      operands = input[0, input.index(" == ")].gsub(" + ", " ").split(" ")
      sum = input[input.index(" == ") + " == ".length, input.length].to_i
      operands.each do |operand|
        if operand.start_with?("0") or input[input.index(" == ") + " == ".length, input.length].start_with?("0")
          return false
        end
        sum -= operand.to_i
      end
      return sum == 0
    end
    
    letter = letters.pop()
    numbers.each do |number|
      input = input.gsub(letter, number.to_s)
      i = numbers.index(number)
      numbers.delete_at(i)
      hash[letter] = number
      solution_found = self.assign_number_to_letter(input, letters, numbers, hash)
      if solution_found
        return true
      end
      input = input.gsub(number.to_s, letter)
      numbers.insert(i, number)
      hash.delete(letter)
    end
    letters.push(letter)
    return false
    
  end
  
end

module BookKeeping
  VERSION = 4
end