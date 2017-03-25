class Anagram

  def initialize(anagram)
    @anagram = anagram
  end
  
  def match(words)
    anagrams = []
    words.each do |word|
      word_copy = word.downcase
      match = true
      @anagram.downcase.split("").each do |letter|
        if word_copy !~ /#{letter}/i
          match = false
          break
        end
        word_copy = word_copy.sub(letter, "")
      end
      if match and word_copy == "" and word.downcase != @anagram.downcase
        anagrams.push(word)
      end
    end
    return anagrams
  end
  
end

module BookKeeping
  VERSION = 2
end