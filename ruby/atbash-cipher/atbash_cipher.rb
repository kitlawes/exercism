class Atbash
  def self.encode(plaintext)
    plaintext = plaintext.gsub(/[ ,.]/, "").downcase
    ciphertext = ""
    count = 0
    plaintext.split("").each do |character|
      if count != 0 and count % 5 == 0
        ciphertext += " "
      end
      if character.ord >= 97 and character.ord <= 97 + 26 - 1
        ciphertext += (97 + 97 + 26 - 1 - character.ord).chr
      else
        ciphertext += character
      end
      count += 1
    end
    return ciphertext
  end
end