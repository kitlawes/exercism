class OCR

  def initialize(text)
    @text = text
  end
  
  def convert()
  
    lines = @text.split("\n")
    digit_rows = []
    for i in 0..(lines.length / 4 - 1)
      digit_row = []
      for j in 0..(lines[0].length / 3 - 1)
        digit = ""
        digit += lines[i * 4 + 0][j * 3, 3] + "\n"
        digit += lines[i * 4 + 1][j * 3, 3] + "\n"
        digit += lines[i * 4 + 2][j * 3, 3]
        digit_row.push(digit)
      end
      digit_rows.push(digit_row)
    end
    
    texts = []
    text = <<-NUMBER.chomp
 _ 
| |
|_|
    NUMBER
    texts.push(text)
    text = <<-NUMBER.chomp
   
  |
  |
    NUMBER
    texts.push(text)
    text = <<-NUMBER.chomp
 _ 
 _|
|_ 
    NUMBER
    texts.push(text)
    text = <<-NUMBER.chomp
 _ 
 _|
 _|
    NUMBER
    texts.push(text)
    text = <<-NUMBER.chomp
   
|_|
  |
    NUMBER
    texts.push(text)
    text = <<-NUMBER.chomp
 _ 
|_ 
 _|
    NUMBER
    texts.push(text)
    text = <<-NUMBER.chomp
 _ 
|_ 
|_|
    NUMBER
    texts.push(text)
    text = <<-NUMBER.chomp
 _ 
  |
  |
    NUMBER
    texts.push(text)
    text = <<-NUMBER.chomp
 _ 
|_|
|_|
    NUMBER
    texts.push(text)
    text = <<-NUMBER.chomp
 _ 
|_|
 _|
    NUMBER
    texts.push(text)
    
    result = ""
    digit_rows.each do |digit_row|
      digit_row.each do |digit|
        match = false
        for i in 0..(texts.length - 1)
          if digit == texts[i]
            result += i.to_s
            match = true
            break
          end
        end
        if !match
          result += "?"
        end
      end
      result += ","
    end
    return result[0, result.length - 1]
    
  end
  
end