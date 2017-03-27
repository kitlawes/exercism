class Acronym
  def self.abbreviate(phrase)
    
    phrase = phrase.gsub(/[-]/, " ")
    
    for i in 0..phrase.length
      if phrase[i] =~ /[A-Z]/ and i > 0 and phrase[i - 1] =~ /[a-z]/
        phrase = phrase[0, i] + " " + phrase[i, phrase.length]
      end
    end
    
    words = phrase.split(" ")
    abbreviation = ""
    words.each do |word|
      abbreviation += word[0].upcase
    end
    return abbreviation
    
  end
end

module BookKeeping
  VERSION = 2
end