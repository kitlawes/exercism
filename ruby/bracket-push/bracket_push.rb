class Brackets

  def self.paired?(expression)
    brackets = []
    pairs = {"[" => "]", "{" => "}", "(" => ")"}
    expression.split("").each do |character|
      if character =~ /[\[{(]/
        brackets.push(character)
      end
      if character =~ /[\]})]/
        if character != pairs[brackets.last]
          return false
        end
        brackets.pop()
      end
    end
    if brackets.empty?
      return true
    else
      return false
    end
  end
  
end

module BookKeeping
  VERSION = 3
end