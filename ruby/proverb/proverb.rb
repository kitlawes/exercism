class Proverb

  def initialize(*arguments)
    if arguments[arguments.length - 1].is_a?(Hash)
      @arguments = arguments[0, arguments.length - 1]
      @qualifier = arguments[arguments.length - 1][:qualifier]
    else
      @qualifier = ""
      @arguments = arguments
    end
  end
  
  def to_s()
    proverb = ""
    for i in 0..(@arguments.length - 2)
      proverb += "For want of a " + @arguments[i] + " the " + @arguments[i + 1] + " was lost.\n"
    end
    proverb += "And all for the want of a "
    if @qualifier != ""
      proverb += @qualifier + " "
    end
    proverb += @arguments[0] + "."
    return proverb
  end
  
end