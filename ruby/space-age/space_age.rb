class SpaceAge

  def initialize(seconds)
    @seconds = seconds
    @earth_orbit = 365.25
    @mercury_orbit = 0.2408467
    @venus_orbit = 0.61519726
    @mars_orbit = 1.8808158
    @jupiter_orbit = 11.862615
    @saturn_orbit = 29.447498
    @uranus_orbit = 84.016846
    @neptune_orbit = 164.79132
  end
  
  def seconds()
    return @seconds
  end
  
  def on_earth()
    return @seconds / 60.0 / 60.0 / 24.0 / @earth_orbit
  end
  
  def on_mercury()
    return on_earth() * (1.0 / @mercury_orbit)
  end
  
  def on_venus()
    return on_earth() * (1.0 / @venus_orbit)
  end
  
  def on_mars()
    return on_earth() * (1.0 / @mars_orbit)
  end
  
  def on_jupiter()
    return on_earth() * (1.0 / @jupiter_orbit)
  end
  
  def on_saturn()
    return on_earth() * (1.0 / @saturn_orbit)
  end
  
  def on_uranus()
    return on_earth() * (1.0 / @uranus_orbit)
  end
  
  def on_neptune()
    return on_earth() * (1.0 / @neptune_orbit)
  end
  
end

module BookKeeping
  VERSION = 3
end