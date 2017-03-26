class Bst

  VERSION = 1

  def initialize(data)
    @data = data
    @left_bst = nil
    @right_bst = nil
  end
  
  def data()
    return @data
  end
  
  def insert(new_data)
    if new_data <= @data
      if @left_bst == nil
        @left_bst = Bst.new(new_data)
      else
        @left_bst.insert(new_data)
      end
    else
      if @right_bst == nil
        @right_bst = Bst.new(new_data)
      else
        @right_bst.insert(new_data)
      end
    end
  end
  
  def left()
    return @left_bst
  end
  
  def right()
    return @right_bst
  end
  
  def each(&operation)
    enumerator = Enumerator.new do |array|
      add_data_to_array(array)
    end
    return enumerator.each(&operation)
  end
  
  def add_data_to_array(array)
    if @left_bst != nil
      @left_bst.add_data_to_array(array)
    end
    array << @data
    if @right_bst != nil
      @right_bst.add_data_to_array(array)
    end
  end
  
end