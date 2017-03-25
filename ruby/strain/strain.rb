class Array

  def keep(&operation)
    kept = []
    self.each do |element|
      if operation.call(element)
        kept.push(element)
      end
    end
    return kept
  end
  
  def discard(&operation)
    kept = []
    self.each do |element|
      if !operation.call(element)
        kept.push(element)
      end
    end
    return kept
  end
  
end