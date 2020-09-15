# Gessica Mohr and Pauline Chane (aka @GeMath18 and @Pauline Chane on GitHub)
# Ada Developers Academy C14
# Week 3 - Adagrams Pair Programming Project - adagrams.rb
# 09/18/2020

def draw_letters()
  # array of hash of hashes where letter points to key/value pairs for max # allowed and # used up in draw
  letter_array =[{"A"=>{"max_num" => 9,"num_used" => 0}},
                 {"B"=>{"max_num" => 2, "num_used" => 0}},
                 {"C"=>{"max_num" => 2, "num_used" => 0}},
                 {"D"=>{"max_num" => 4, "num_used" => 0}},
                 {"E"=>{"max_num" => 12, "num_used" => 0}},
                 {"F"=>{"max_num" => 2, "num_used" => 0}},
                 {"G"=>{"max_num" => 3, "num_used" => 0}},
                 {"H"=>{"max_num" => 2, "num_used" => 0}},
                 {"I"=>{"max_num" => 9, "num_used" => 0}},
                 {"J"=>{"max_num" => 1, "num_used" => 0}},
                 {"K"=>{"max_num" => 1, "num_used" => 0}},
                 {"L"=>{"max_num" => 4, "num_used" => 0}},
                 {"M"=>{"max_num" => 2, "num_used" => 0}},
                 {"N"=>{"max_num" => 6, "num_used" => 0}},
                 {"O"=>{"max_num" => 8, "num_used" => 0}},
                 {"P"=>{"max_num" => 2, "num_used" => 0}},
                 {"Q"=>{"max_num" => 1, "num_used" => 0}},
                 {"R"=>{"max_num" => 6, "num_used" => 0}},
                 {"S"=>{"max_num" => 4, "num_used" => 0}},
                 {"T"=>{"max_num" => 6, "num_used" => 0}},
                 {"U"=>{"max_num" => 4, "num_used" => 0}},
                 {"V"=>{"max_num" => 2, "num_used" => 0}},
                 {"W"=>{"max_num" => 2, "num_used" => 0}},
                 {"X"=>{"max_num" => 1, "num_used" => 0}},
                 {"Y"=>{"max_num" => 2,"num_used" => 0}},
                 {"Z"=>{"max_num" => 1, "num_used" => 0}}]
  # shovel array
  letter_bucket = []

  # doesn't exit loop until 10 letters have been successfully added
  while letter_bucket.length < 10
    temp_letter_hash = letter_array[rand(26)]
    temp_letter = temp_letter_hash.keys[0]

    # only adds letter if counter to add letter "num_used" would be less than or equal to max_num upon addition
    if temp_letter_hash[temp_letter]["num_used"] < temp_letter_hash[temp_letter]["max_num"]
      letter_bucket << temp_letter

      # increment num_used
      temp_letter_hash[temp_letter]["num_used"] += 1
    end
  end

  return letter_bucket
end

def uses_available_letters?(input, letters_in_hand)
  letters_copy = letters_in_hand.clone # letters_in_hand will be kept the same even if any of the letters evals to false
  input.each_char { |o|
    index = letters_copy.find_index(o)
    if index.nil?
      return false
    else
      letters_copy.delete_at(index)
    end
  }
  return true
end

def score_word(word)

  score_word = { "A" => 1, "E" => 1, "I" => 1, "O" => 1, "U" => 1, "L" => 1, "N" => 1, "R" => 1, "S" => 1, "T" => 1, "D" => 2, "G" => 2, "B" => 3, "C" => 3, "M" => 3, "P" => 3, "F" => 4, "H" => 4, "V" => 4, "W" => 4, "Y" => 4, "K" => 5, "J" => 8, "X" => 8, "Q" => 10, "Z" => 10}

  score = word.length > 6 ? 8 : 0

  word.each_char{|c| score += score_word[c.upcase]}
  return score

end