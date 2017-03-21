class Hamming
  def self.compute(sequence_1, sequence_2)
    hamming_distance = 0
    for i in 0..(sequence_1.length - 1)
      if sequence_1[i] != sequence_2[i]
        hamming_distance += 1
      end
    end
    return hamming_distance
  end
end