class FlattenArray

  VERSION = 1
  
  def self.flatten(array)
    flat_array = []
    array.each do |element|
      if element.kind_of?(Array)
        flat_array.concat(self.flatten(element))
      elsif element != nil
        flat_array.push(element)
      end
    end
    return flat_array
  end
  
end