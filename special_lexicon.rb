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

  def valid_word?(string)
    !string.match(/\A[a-zA-Z]*\z/).nil?
  end

  # Generates an array of all the anagrams of the given word
  def get_anagrams(word)
    # FILL ME IN
    unless valid_word?(word)
      return "Invalid input (string should only consist of letters)."
    end
    counter = get_counts(word.downcase)
    if @anagrams.has_key?(counter) && @anagrams[counter].size() > 0
      return @anagrams[counter].to_a - [word.downcase]
    else
      return "No anagrams found!"
    end
  end


  # Generates an array of all the words that have the given word as a prefix
  def get_prefixed_words(prefix)
    # FILL ME IN
    unless valid_word?(prefix)
      return "Invalid input (string should only consist of letters)."
    end
    output = findWords(prefix)
    if output.length() == 0
      return "No prefixed words found!"
    end
    output
  end

  # Generates the shortest possible word ladder connecting the two words
  def get_word_ladder(start_word, end_word)
    # FILL ME IN
    # error handling
    unless valid_word?(start_word) || valid_word?(end_word)
      return "Invalid input (start and end words should only consist of letters)."
    end
    if start_word.length != end_word.length
      return "Both words have unequal lengths, please try again!"
    end

    letters = *('a'..'z') # test each character in alphabet

    start_word = Word.new(start_word)
    visited = Set.new
    queue = [start_word]

    while queue
      curr = queue.shift
      curr_word = curr.val

      # return word ladder
      if curr_word == end_word
        return curr.path
      end

      curr_word.each_char.with_index do |char, i| # length of curr word
        letters.each{ |c| # a->z
          next_word = curr_word[0...i] + c + curr_word[i + 1...curr_word.size] 
          next_word_obj = Word.new(next_word)
          if !visited.include?(next_word) && is_word?(next_word)
            # add onto current path and add new word object to queue
            new_path = curr.path.clone
            new_path << next_word
            next_word_obj.path = new_path
            visited.add(next_word)
            queue << next_word_obj
          end
        }
      end
    end

    []
  end
end
