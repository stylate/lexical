require './lexicon'
require './word'

class SpecialLexicon < Lexicon

  # access anagrams and helper functions from parent class
  attr_accessor :anagrams, :trie, :hash

  def get_counts(word)
    super(word)
  end

  def is_word?(word)
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
  
  # Traverses through the implicit linked list (Word) object and generates the ladder.
  def getLadder(end_word)
    stack = []
    curr_word = end_word
    while curr_word
      stack << curr_word.val
      curr_word = curr_word.prev
    end
    stack.reverse()
  end

  # Generates the shortest possible word ladder connecting the two words
  def get_word_ladder(start_word, end_word)
    # FILL ME IN
    # problem with this solution: a little bit inefficient due to queue
    letters = *('a'..'z')

    start_word = Word.new(start_word) # parameters point to current word (string) and previous word object
    visited = Set.new
    queue = [start_word]

    while queue # can potentially go through entire dictionary
      curr = queue.shift
      curr_word = curr.val

      if curr_word == end_word
        return getLadder(curr)
      end

      curr_word.each_char.with_index do |char, i| # length of curr word
        letters.each{ |c| # a->z
          next_word = curr_word[0...i] + c + curr_word[i + 1...curr_word.size]
          next_word_obj = Word.new(next_word, curr)
          if !visited.include?(next_word) && is_word?(next_word)
            visited.add(next_word)
            queue << next_word_obj
          end
        }
      end
    end

    []
  end
end
