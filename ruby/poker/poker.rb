class Poker

  def initialize(hands)
    @hands = hands
  end
  
  def best_hand()
  
    hand_ranks = []
    hand_numbers = []
    best_rank = 10
    @hands.each do |hand|
      
      # Extract numbers and suits from the hand
      numbers = []
      suits = []
      hand.each do |card|
        if card[0, card.length - 1] == "J"
          numbers.push(11)
        elsif card[0, card.length - 1] == "Q"
          numbers.push(12)
        elsif card[0, card.length - 1] == "K"
          numbers.push(13)
        elsif card[0, card.length - 1] == "A"
          numbers.push(14)
        else
          numbers.push(card[0, card.length - 1].to_i)
        end
        suits.push(card[card.length - 1])
      end
      numbers = numbers.sort.reverse
      if numbers == [14, 5, 4, 3, 2]
        numbers = [5, 4, 3, 2, 1]
      end
      suits = suits.uniq
      unique_numbers = numbers.uniq
      counts = []
      unique_numbers.each do |unique_number|
        counts.push(numbers.count(unique_number))
      end
      counts = counts.sort.reverse
      
      # Order the numbers as four-of-a-kind then three-of-a-kind then two-of-a-kind then one-of-a-kind
      # Within these categories, order the numbers in descending numerical order
      i = 0
      for j in i..1
        if (numbers[j] == numbers[j + 1] &&
            numbers[j] == numbers[j + 2] &&
            numbers[j] == numbers[j + 3])
            numbers = numbers[j, 4] + numbers[0,  j] + numbers[j + 4,  5 - (j + 4)]
            i += 4
            break
        end
      end
      for j in i..2
        if (numbers[j] == numbers[j + 1] &&
            numbers[j] == numbers[j + 2])
            numbers = numbers[0, i] + numbers[j, 3] + numbers[i,  j - i] + numbers[j + 3,  5 - (j + 3)]
            i += 3
            break
        end
      end
      for j in i..3
        if numbers[j] == numbers[j + 1]
            numbers = numbers[0, i] + numbers[j, 2] + numbers[i,  j - i] + numbers[j + 2,  5 - (j + 2)]
            i += 2
            break
        end
      end
      for j in i..3
        if numbers[j] == numbers[j + 1]
            numbers = numbers[0, i] + numbers[j, 2] + numbers[i,  j - i] + numbers[j + 2,  5 - (j + 2)]
            break
        end
      end
      hand_numbers.push(numbers)
      
      # Find the rank of the hand
      if (suits.length == 1 &&
          numbers[0] == numbers[1] + 1 &&
          numbers[1] == numbers[2] + 1 &&
          numbers[2] == numbers[3] + 1 &&
          numbers[3] == numbers[4] + 1)
        hand_ranks.push(1)
        best_rank = [best_rank, 1].min
      elsif counts[0] == 4
        hand_ranks.push(2)
        best_rank = [best_rank, 2].min
      elsif counts[0] == 3 && counts[1] == 2
        hand_ranks.push(3)
        best_rank = [best_rank, 3].min
      elsif suits.length == 1
        hand_ranks.push(4)
        best_rank = [best_rank, 4].min
      elsif (numbers[0] == numbers[1] + 1 &&
             numbers[1] == numbers[2] + 1 &&
             numbers[2] == numbers[3] + 1 &&
             numbers[3] == numbers[4] + 1)
        hand_ranks.push(5)
        best_rank = [best_rank, 5].min
      elsif counts[0] == 3
        hand_ranks.push(6)
        best_rank = [best_rank, 6].min
      elsif counts[0] == 2 && counts[1] == 2
        hand_ranks.push(7)
        best_rank = [best_rank, 7].min
      elsif counts[0] == 2
        hand_ranks.push(8)
        best_rank = [best_rank, 8].min
      else
        hand_ranks.push(9)
        best_rank = [best_rank, 9].min
      end
      
    end
    
    # Get the best hands within the best ranked hands
    best_hands = []
    best_hand_numbers = [0, 0, 0, 0, 0]
    for i in 0..(hand_ranks.length - 1)
      if hand_ranks[i] == best_rank
        if hand_numbers[i] == best_hand_numbers
          best_hands.push(@hands[i])
        else
          for j in 0..4
            if hand_numbers[i][j] > best_hand_numbers[j]
              best_hands = [@hands[i]]
              best_hand_numbers = hand_numbers[i]
              break
            end
            if hand_numbers[i][j] < best_hand_numbers[j]
              break
            end
          end
        end
      end
    end
    
    return best_hands
    
  end
  
end

module BookKeeping
  VERSION = 2
end