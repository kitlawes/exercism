class PigLatin
  def self.translate(phrase)
  
    words = phrase.split(" ")
    result = ""
    words.each do |word|
      if word =~ /\A[aeiou]|(yt)|(xr)/
        result += word
      elsif word.index(/u/) == word.index(/[aeiou]/) and word.index(/qu/) == word.index(/[u]/) - 1
        result += word[word.index(/[aeiou]/, word.index(/qu/) + "qu".length), word.length] + word[0, word.index(/[aeiou]/, word.index(/qu/) + "qu".length)]
      else
        result += word[word.index(/[aeiou]/), word.length] + word[0, word.index(/[aeiou]/)]
      end
      result += "ay "
    end
    return result[0, result.length - 1]
    
  end
end