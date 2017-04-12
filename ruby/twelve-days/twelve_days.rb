class TwelveDays
  def self.song
    
    digits_to_ordinal = {
        1 => "first",
        2 => "second",
        3 => "third",
        4 => "fourth",
        5 => "fifth",
        6 => "sixth",
        7 => "seventh",
        8 => "eighth",
        9 => "ninth",
        10 => "tenth",
        11 => "eleventh",
        12 => "twelfth",
      }
    
    day_to_present = {
        1 => "a Partridge in a Pear Tree",
        2 => "two Turtle Doves",
        3 => "three French Hens",
        4 => "four Calling Birds",
        5 => "five Gold Rings",
        6 => "six Geese-a-Laying",
        7 => "seven Swans-a-Swimming",
        8 => "eight Maids-a-Milking",
        9 => "nine Ladies Dancing",
        10 => "ten Lords-a-Leaping",
        11 => "eleven Pipers Piping",
        12 => "twelve Drummers Drumming",
      }
    
    song = ""
    for i in 1..12
    
      song += "On the " + digits_to_ordinal[i] + " day of Christmas my true love gave to me"
      
      for j in i.downto(1)
        if j == 1 and i == 1
          song += ", " + day_to_present[j] + "."
        end
        if j == 1 and i != 1
          song += ", and " + day_to_present[j] + "."
        end
        if j > 1
          song += ", " + day_to_present[j]
        end
      end
      
      if i < 12
        song += "\n"
      end
      song += "\n"
      
    end
    return song
    
  end
end

module BookKeeping
  VERSION = 2
end