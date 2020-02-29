# Create a Trie structure in order to find all words that start with a given prefix.

class TrieNode

    attr_reader :val, :children
    attr_accessor :is_word

    def initialize(val)
        @val = val
        @children = Hash.new{TrieNode.new}
        @is_word = false
    end

    # appends character value c to children unless c already exists in children
    def insert_child(c)
        if @children.include?(c)
            return @children[c]
        else
            @children[c] = TrieNode.new(c)
            return @children[c]
        end
    end
end

class Trie

    def initialize()
        @root = TrieNode.new('*') # * = dummy node
    end

    # inserts word in trie
    def insert(word)
        node = @root
        word.each_char { |c|
            child = node.insert_child(c)
            node = child
        }
        node.is_word = true
    end

    # search for word in trie and return the end (whether it is a prefix or the full word)
    def search(word)
        node = @root
        word.each_char { |c|
            unless node.children.key?(c)
                return nil
            end
            node = node.children[c]
        }
        return node
    end

    # performs autocomplete for the current path by traversing down the trie
    def autocomplete(curr_node, curr_path, word_list)
        if curr_node.is_word
            word_list << curr_path
        end

        # recursively visit each child in the node's children => all prefixed words
        curr_node.children.each_value { |child| 
            autocomplete(child, curr_path + child.val, word_list)
        }
    end

    # perform autocomplete starting with the prefix
    def findWords(prefix)
        words = []
        prefix_node = search(prefix)
        unless prefix_node
            return words
        end

        autocomplete(prefix_node, prefix, words)
        words - [prefix]
    end
end