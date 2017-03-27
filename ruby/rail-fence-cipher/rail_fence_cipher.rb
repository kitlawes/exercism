class RailFenceCipher

  VERSION = 1

  def self.encode(plaintext, rails)
    
    ciphertext = ""
    offset = 0
    if rails == 1
      gap = 1
    else
      gap = rails * 2 - 2
    end
    for i in 1..rails
      j = offset
      ciphertext += plaintext[j].to_s
      while true do
      
        if gap > 0
          j += gap
          if j >= plaintext.length
            break
          end
          ciphertext += plaintext[j].to_s
        end
        
        if (rails * 2 - 2) - gap > 0
          j += (rails * 2 - 2) - gap
          if j >= plaintext.length
            break
          end
          ciphertext += plaintext[j].to_s
        end
        
      end
      offset += 1
      gap -= 2
    end
    return ciphertext
    
  end
  
  def self.decode(ciphertext, rails)
    
    offsets = [0]
    if rails == 1
      offset = ciphertext.length
    else
      offset = (ciphertext.length.to_f / (rails * 2 - 2)).ceil
    end
    for j in 2..rails
      offsets.push(offset)
      base = (ciphertext.length.to_f / (rails * 2 - 2)).floor * 2
      remainder = ciphertext.length - ((ciphertext.length.to_f / (rails * 2 - 2)).floor * (rails * 2 - 2))
      offset += base + (remainder >= j ? 1 : 0) + (remainder >= (rails * 2 - 2) - (j - 2) ? 1 : 0)
    end
    
    plaintext = ""
    decode_complete = false
    while !decode_complete do
      for i in (0.upto(rails - 1).to_a).concat((rails - 2).downto(1).to_a)
        plaintext += ciphertext[offsets[i]].to_s
        if plaintext.length == ciphertext.length
          decode_complete = true
          break
        end
        offsets[i] += 1
      end
    end
    return plaintext
    
  end
  
end