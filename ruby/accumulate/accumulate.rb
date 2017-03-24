class Array
  def accumulate(&operation)
    
    if operation == nil
      return self
    end
    
    result = []
    self.each do |element|
       result.push(operation.call(element))
    end
    return result
    
  end
end

module BookKeeping
  VERSION = 1
end