class Series

  def initialize(series)
    @series = series
  end
  
  def slices(length)
  
    if length > @series.length
      raise ArgumentError
    end
  
    slices = []
    for i in 0..(@series.length - length)
      slices.push(@series[i, length])
    end
    return slices
    
  end
  
end