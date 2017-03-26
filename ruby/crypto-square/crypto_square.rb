class Crypto

  def initialize(plaintext)
    @plaintext = plaintext
  end
  
  def normalize_plaintext()
    return @plaintext.gsub(/[#$%^& !,.]/, "").downcase
  end
  
  def size()
    return columns(normalize_plaintext)
  end
  
  def plaintext_segments()
    plaintext_segments = []
    computed_normalized_plaintext = normalize_plaintext
    rows = rows(computed_normalized_plaintext)
    columns = columns(computed_normalized_plaintext)
    i = 0
    for j in 1..(rows - 1)
      plaintext_segments.push(computed_normalized_plaintext[i, columns])
      i += columns
    end
    plaintext_segments.push(computed_normalized_plaintext[i, computed_normalized_plaintext.length - 1])
    return plaintext_segments
  end
  
  def ciphertext()
    ciphertext = ""
    computed_plaintext_segments = plaintext_segments
    for i in 0..(size - 1)
      for j in 0..(computed_plaintext_segments.length - 1)
        if computed_plaintext_segments[j].length > i
          ciphertext += computed_plaintext_segments[j][i]
        end
      end
    end
    return ciphertext
  end
  
  def normalize_ciphertext()
    return segments_text(ciphertext_segments)
  end
  
  def ciphertext_segments()
    ciphertext_segments = []
    computed_normalized_plaintext = normalize_plaintext
    rows = rows(computed_normalized_plaintext)
    columns = columns(computed_normalized_plaintext)
    complete_columns = complete_columns(computed_normalized_plaintext)
    computed_ciphertext = ciphertext
    i = 1
    j = 0
    while i <= complete_columns
      ciphertext_segments.push(computed_ciphertext[j, rows])
      i += 1
      j += rows
    end
    while i <= columns
      ciphertext_segments.push(computed_ciphertext[j, rows - 1])
      i += 1
      j += rows - 1
    end
    return ciphertext_segments
  end
  
  def rows(text)
    return (text.length.to_f / columns(text)).ceil
  end
  
  def columns(text)
    return Math.sqrt(text.length).ceil
  end
  
  def complete_columns(text)
    return text.length - ((rows(text) - 1) * columns(text))
  end
  
  def segments_text(segments)
    segments_text = segments[0]
    for i in 1..(segments.length - 1)
      segments_text += " " + segments[i]
    end
    return segments_text
  end
  
end