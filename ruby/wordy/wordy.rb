class WordProblem

  def initialize(question)
    @question = question
  end
  
  def answer
    words = @question.split(" ")
    answer = words[2].to_i
    i = 3
    while i < words.length
      case words[i]
        when "plus"
          answer += words[i + 1].to_i
          i += 2
        when "minus"
          answer -= words[i + 1].to_i
          i += 2
        when "multiplied"
          answer *= words[i + 2].to_i
          i += 3
        when "divided"
          answer /= words[i + 2].to_i
          i += 3
        else
          raise ArgumentError
      end
    end
    return answer
  end
  
end

module BookKeeping
  VERSION = 1
end