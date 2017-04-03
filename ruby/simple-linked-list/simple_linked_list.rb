class Element

  def initialize(datum)
    @datum = datum
    @next = nil
  end
  
  def datum()
    return @datum
  end
  
  def next()
    return @next
  end
  
  def next=(element)
    @next = element
  end
  
end

class SimpleLinkedList

  def initialize(array = [])
    @first_element = nil
    array.each do |datum|
      push(Element.new(datum))
    end
  end
  
  def push(element)
  
    size = size()
    
    if size == 0
      @first_element = element
      return self
    end
    
    last_element = get_element(size - 1)
    last_element.next = element
    return self
    
  end
  
  def pop()
  
    size = size()
    
    if size == 0
      return nil
    end
    
    last_element = get_element(size - 1)
    if size > 1
      second_last_element = get_element(size - 2)
      second_last_element.next = nil
    end
    return last_element
    
  end
  
  def size()
  
    if @first_element.nil?
      return 0
    end
    
    size = 1
    current_element = @first_element
    next_element = @first_element.next
    while !next_element.nil?
      current_element = next_element
      next_element = current_element.next
      size += 1
    end
    return size
    
  end
  
  def get_element(index)
  
    if index == 0
      return @first_element
    end
    
    current_element = @first_element
    next_element = @first_element.next
    while !next_element.nil?
      current_element = next_element
      next_element = current_element.next
      index -= 1
      if index == 0
        return current_element
      end
    end
    
  end
  
  def to_a()
    
    if @first_element.nil?
      return []
    end
  
    array = []
    current_element = @first_element
    next_element = @first_element.next
    while !next_element.nil?
      array.push(current_element.datum)
      current_element = next_element
      next_element = current_element.next
    end
    array.push(current_element.datum)
    return array.reverse
    
  end
  
  def reverse!()
    
    if @first_element.nil?
      return self
    end
  
    elements = []
    current_element = @first_element
    next_element = @first_element.next
    while !next_element.nil?
      elements.push(current_element)
      current_element.next = nil
      current_element = next_element
      next_element = current_element.next
    end
    elements.push(current_element)
    elements = elements.reverse
    
    @first_element = nil
    elements.each do |element|
      self.push(element)
    end
    return self
    
  end
  
end

module BookKeeping
  VERSION = 1
end