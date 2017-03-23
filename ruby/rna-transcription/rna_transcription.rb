class Complement
    def self.of_dna(dna)
        complement = ""
        for i in 0..(dna.length - 1)
            case dna[i]
            when "G"
                complement += "C"
            when "C"
                complement += "G"
            when "T"
                complement += "A"
            when "A"
                complement += "U"
            else
                return ""
            end
        end
        return complement
    end
end

module BookKeeping
  VERSION = 4
end