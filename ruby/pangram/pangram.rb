class Pangram
  def self.pangram?(phrase)
    letters = []
    for letter in "a".."z"
      letters.push(letter)
    end
    for i in 0..(phrase.length - 1)
      letters.delete(phrase[i].downcase)
    end
    if letters == []
      return true
    else
      return false
    end
  end
end

module BookKeeping
  VERSION = 4
end