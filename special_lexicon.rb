require './lexicon'

class SpecialLexicon < Lexicon

  # access anagrams and helper functions from parent class
  attr_accessor :anagrams, :trie, :hash

  def get_counts(word)
    super(word)
  end

  def findWords(prefix)
    super(prefix)
  end

  # Generates an array of all the anagrams of the given word
  def get_anagrams(word)
    # FILL ME IN
    counter = get_counts(word.downcase)
    if @anagrams.has_key?(counter)
      return @anagrams[counter].to_a - [word.downcase]
    else
      return []
    end
  end


  # Generates an array of all the words that have the given word as a prefix
  def get_prefixed_words(prefix)
    # FILL ME IN
    return findWords(prefix)
  end


  # Generates the shortest possible word ladder connecting the two words
  def get_word_ladder(start_word, end_word)
    # FILL ME IN
    letters = *('a'..'z')

    start_path = [start_word]
    visited = Set.new
    queue = [[start_word, 0]]

    while queue
      curr = queue.shift
      curr_word = curr[0]
      curr_path = curr[1] # use length of path for debugging at the very moment
      p curr

      if curr_word == end_word
        return curr_path
      end

      curr_word.each_char.with_index do |char, i|
        letters.each{ |c|
          next_word = curr_word[0...i - 1] + c + curr_word[i...curr_word.length]
          if !visited.include?(next_word) && @hash.key?(next_word)
            visited.add(next_word)
            queue << [next_word, curr_path + 1]
          end
        }
      end
    end

    []
  end
end
