class FoodChain

  def self.song()
  
    lines = {
      "fly" => "",
      "spider" => "It wriggled and jiggled and tickled inside her.",
      "bird" => "How absurd to swallow a bird!",
      "cat" => "Imagine that, to swallow a cat!",
      "dog" => "What a hog, to swallow a dog!",
      "goat" => "Just opened her throat and swallowed a goat!",
      "cow" => "I don't know how she swallowed a cow!",
      "horse" => "She's dead, of course!"
    }
    
    song = ""
    lines.keys.each do |animal|
      song += verse(animal, lines)
    end
    return song
    
  end
  
  def self.verse(animal, lines)
    verse = "I know an old lady who swallowed a " + animal + ".\n"
    if animal != "fly"
      verse += lines[animal] + "\n"
    end
    if animal != "horse"
      for i in lines.keys.index(animal).downto(0)
        current_animal = lines.keys[i]
        if current_animal == "bird"
          verse += "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n"
        elsif current_animal == "fly"
          verse += "I don't know why she swallowed the fly. Perhaps she'll die.\n"
        else
          verse += "She swallowed the " + current_animal + " to catch the " + lines.keys[i - 1] + ".\n"
        end
      end
      verse += "\n"
    end
    return verse
  end
  
end

module BookKeeping
  VERSION = 2
end