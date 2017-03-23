class Complement
  def self.of_dna(dna)
    case dna
        when "G"
            return "C"
        when "C"
            return "G"
        when "T"
            return "A"
    end
  end
end