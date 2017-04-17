class BinarySearch

  def initialize(array)
  
    for i in 1..(array.length - 1)
      if array[i - 1] > array[i]
        raise ArgumentError
      end
    end
    
    @array = array
    
  end

  def list
    return @array
  end

  def search_for(number)
    
    if @array.empty?
      raise RuntimeError
    end
    
    if @array[middle] == number
      return middle
    elsif @array[middle] > number
      return BinarySearch.new(@array[0, middle]).search_for(number)
    elsif @array[middle] < number
      return middle + 1 + BinarySearch.new(@array[middle + 1, @array.length - (middle + 1)]).search_for(number)
    end
    
  end

  def middle
    return @array.length / 2
  end
  
end