class Word
    attr_accessor :val, :prev
    def initialize(curr, prev = nil)
        @val = curr
        @prev = prev
    end
end