class RunLengthEncoding

  def self.encode(input)
  
    if input.length == 0
      return ""
    end
    
    output = ""
    count = 1
    for i in 1..input.length
      if input[i] == input[i - 1]
        count += 1
      else
        if count > 1
          output += count.to_s
        end
        output += input[i - 1]
        count = 1
      end
    end
    return output
    
  end
  
  def self.decode(input)
  
    if input.length == 0
      return ""
    end
    
    output = ""
    i = 0
    while i < input.length do
      if input[i] =~ /[0-9]/
        j = input[i, input.length - 1].index(/[^0-9]/)
        for k in 1..input[i, j].to_i
          output += input[i + j]
        end
        i += j
      else
        output += input[i]
      end
      i += 1
    end
    return output
    
  end
  
end

module BookKeeping
  VERSION = 2
end