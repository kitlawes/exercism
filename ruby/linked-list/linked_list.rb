class Element

  def initialize(number)
    @number = number
    @next = nil
  end
  
  def number()
    return @number
  end
  
  def next()
    return @next
  end
  
  def next=(element)
    @next = element
  end
  
end

class Deque

  def initialize()
    @first_element = nil
  end
  
  def push(number)
  	element = Element.new(number)
    if @first_element.nil?
      @first_element = element
    else
	  size = size()
	  last_element = get_element(size - 1)
	  last_element.next = element
	end
  end
  
  def pop()
    size = size()
    if size == 1
	  first_element = @first_element
	  @first_element = nil
	  return first_element.number
    elsif size > 1
	  last_element = get_element(size - 1)
	  second_last_element = get_element(size - 2)
	  second_last_element.next = nil
	  return last_element.number
    end
  end
  
  def unshift(number)
  	element = Element.new(number)
    if @first_element.nil?
      @first_element = element
    else
	  element.next = @first_element
	  @first_element = element
	end
  end
  
  def shift()
    size = size()
    if size == 1
	  first_element = @first_element
	  @first_element = nil
	  return first_element.number
    elsif size > 1
	  first_element = @first_element
	  @first_element = @first_element.next
	  return first_element.number
    end
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

end