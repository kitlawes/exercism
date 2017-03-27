class Nucleotide
  
  def self.from_dna(dna)
    if dna =~ /[^ACGT]/
      raise ArgumentError
    end
    @@dna = dna
    return Nucleotide
  end
  
  def self.count(nucleotide)
    return @@dna.count(nucleotide)
  end
  
  def self.histogram()
    return {"A" => self.count("A"), "C" => self.count("C"), "G" => self.count("G"), "T" => self.count("T")}
  end
  
end