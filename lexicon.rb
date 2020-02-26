class Lexicon

  def initialize
    # The full array of all words
    @array = []
    # A hash containing all the words as keys
    @hash = {}

    # hash containing word counts as keys and potential anagrams as values
    # https://stackoverflow.com/questions/40338981/how-do-i-put-sets-or-arrays-in-a-two-dimensional-ruby-hash
    @anagrams = Hash.new { |hash, key| hash[key] = Set.new }

    file = File.new('words.txt', 'r')
    while (line = file.gets)
      line.strip!.downcase!
      @array.push line
      freq = get_counts(line)
      @anagrams[freq].add line
      @hash[line] = true
    end
    file.close
  end

  # Acquires the character frequencies of WORD. Equivalent to Python's Counter object.
  # https://stackoverflow.com/questions/16124735/letter-count-in-a-sentence-using-ruby
  def get_counts(word)
    h = Hash.new(0)
    word.each_char do |char| 
        next unless char =~/\w/
        h[char] += 1
    end
    h
  end

  # Returns true if the given word is in the lexicon
  def is_word?(word)
    return @hash.has_key?(word.downcase)
  end
end
