class Word
    attr_accessor :val, :path

    # val represents the word and path represents the ladder itself.
    def initialize(curr)
        @val = curr
        @path = [curr]
    end
end