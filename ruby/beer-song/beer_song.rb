class BeerSong
  
  def verse(bottles)
  
    if bottles == 0
      return <<-TEXT
No more bottles of beer on the wall, no more bottles of beer.
Go to the store and buy some more, 99 bottles of beer on the wall.
TEXT
    end
  
    if bottles == 1
      return <<-TEXT
1 bottle of beer on the wall, 1 bottle of beer.
Take it down and pass it around, no more bottles of beer on the wall.
TEXT
    end
  
    if bottles == 2
      return <<-TEXT
2 bottles of beer on the wall, 2 bottles of beer.
Take one down and pass it around, 1 bottle of beer on the wall.
TEXT
    end
    
    return <<-TEXT
#{bottles} bottles of beer on the wall, #{bottles} bottles of beer.
Take one down and pass it around, #{bottles - 1} bottles of beer on the wall.
TEXT
    
  end
  
  def verses(start_bottles, end_bottles)
    verses = verse(start_bottles)
    (start_bottles - 1).downto(end_bottles).each do |bottles|
      verses += "\n" + verse(bottles)
    end
    return verses
  end
  
end

module BookKeeping
  VERSION = 3
end