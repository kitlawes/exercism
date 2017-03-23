class Bob
  def self.hey(remark)
  
    if remark.strip.empty?
      return "Fine. Be that way!"
    end
    
    lower_case_letters = []
    for letter in "a".."z"
      lower_case_letters.push(letter)
    end
    upper_case_letters = []
    for letter in "A".."Z"
      upper_case_letters.push(letter)
    end
    shouting = false
    for i in 0..(remark.length - 1)
      if lower_case_letters.include?(remark[i])
        shouting = false
        break
      end
      if upper_case_letters.include?(remark[i])
        shouting = true
      end
    end
    if shouting
      return "Whoa, chill out!"
    end
  
    if remark[remark.length - 1] == "?"
      return "Sure."
    end
    
    return "Whatever."
    
  end
end