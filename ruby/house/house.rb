class House
  def self.recite()
  
    lines = {
      "horse and the hound and the horn" => "belonged to",
      "farmer sowing his corn" => "kept",
      "rooster that crowed in the morn" => "woke",
      "priest all shaven and shorn" => "married",
      "man all tattered and torn" => "kissed",
      "maiden all forlorn" => "milked",
      "cow with the crumpled horn" => "tossed",
      "dog" => "worried",
      "cat" => "killed",
      "rat" => "ate",
      "malt" => "that lay in the house that Jack built."
    }
  
    rhyme = "This is the house that Jack built.\n"
    for i in (lines.keys.length - 1).downto(0)
      rhyme += "\n"
      rhyme += "This is the " + lines.keys[i] + "\n"
      for j in i.upto(lines.keys.length - 2)
        rhyme += "that " + lines[lines.keys[j]] + " the " + lines.keys[j + 1] + "\n"
      end
      rhyme += "that lay in the house that Jack built.\n"
    end
    return rhyme
    
  end
end