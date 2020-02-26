require './lexicon'

class SpecialLexicon < Lexicon

  # access anagrams and helper functions from parent class
  attr_accessor :anagrams

  def get_counts(word)
    super(word)
  end

  # Generates an array of all the anagrams of the given word
  def get_anagrams(word)
    # FILL ME IN
    counter = get_counts(word.downcase)
    puts counter # debug
    if @anagrams.has_key?(counter)
      return @anagrams[counter].to_a - [word.downcase]
    else
      return []
    end
  end


  # Generates an array of all the words that have the given word as a prefix
  def get_prefixed_words(prefix)
    # FILL ME IN
    return []
  end


  # Generates the shortest possible word ladder connecting the two words
  def get_word_ladder(start_word, end_word)
    # FILL ME IN
    return []
  end
end
