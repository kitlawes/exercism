class Phrase

  def initialize(phrase)
    @phrase = phrase
  end
  
  def word_count()
    counts = {}
    words = @phrase.gsub(/[,.:]/," ").split()
    for i in 0..(words.length - 1)
      word = words[i].gsub(/[!&@$%^]/,"").downcase
      if word.start_with?("'")
        word[0] = ""
      end
      if word.end_with?("'")
        word[word.length - 1] = ""
      end
      if !(counts.has_key? word)
        counts[word] = 0
      end
      counts[word] += 1
    end
    return counts
  end
  
end

module BookKeeping
  VERSION = 1
end