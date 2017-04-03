class Cipher

  def initialize(key = "aaaaaaaaaa")
    if key =~ /[A-Z0-9]/ || key == ""
      raise ArgumentError
    end
    @key = key
  end
  
  def key
    return @key
  end
  
  def encode(plaintext)
    ciphertext = ""
    plaintext_array = plaintext.split("")
    key_array = key.split("")
    for i in 0..(plaintext_array.length() - 1)
      ciphertext += (((plaintext_array[i].chr.ord - 97) + (key_array[i].chr.ord - 97)) % 26 + 97).chr
    end
    return ciphertext
  end
  
  def decode(ciphertext)
    plaintext = ""
    ciphertext_array = ciphertext.split("")
    key_array = key.split("")
    for i in 0..(ciphertext_array.length() - 1)
      plaintext += (((ciphertext_array[i].chr.ord - 97) - (key_array[i].chr.ord - 97)) % 26 + 97).chr
    end
    return plaintext
  end
  
end