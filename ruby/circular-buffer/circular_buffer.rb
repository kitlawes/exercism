class CircularBuffer

  def initialize(size)
    @size = size
    @buffer = []
    @pointer = 0
  end

  def read
    if @pointer > @buffer.size - 1
      raise BufferEmptyException
    else
      data = @buffer.delete_at(@pointer)
      if @pointer == @buffer.size
        @pointer = 0
      end
      return data
    end
  end

  def write(data)
    if @buffer.size == @size
      raise BufferFullException
    else
      @buffer.insert(@pointer, data)
      @pointer = (@pointer + 1) % @buffer.size
    end
  end

  def write!(data)
    if @buffer.size == @size
      @buffer[@pointer] = data
      @pointer = (@pointer + 1) % @buffer.size
    else
      @buffer.insert(@pointer, data)
      @pointer = (@pointer + 1) % @buffer.size
    end
  end

  def clear
    initialize(@size)
  end
  
  class BufferEmptyException < StandardError
    def initialize
      super
    end
  end
  
  class BufferFullException < StandardError
    def initialize
      super
    end
  end
  
end
