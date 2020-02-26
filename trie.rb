# Create a Trie structure in order to find all words that start with a given prefix.

class TrieNode

    attr_reader :val, :children
    attr_accessor :is_word

    def initialize(val)
        @val = val
        @children = Hash.new{TrieNode.new}
        @is_word = false
    end

    # appends character value c to children
    def insert_child(c)
        if @children.include?(c)
            return @children[c]
        else
            @children[c] = TrieNode.new(c)
            return @children[c]
        end
    end

    # attempts to get character c from current trie node
    def get_char(c)
        if @children.key?(c)
            return @children[c]
        else
            return nil
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
            unless @children.key?(c)
                return nil
            end
            node = @children[c]
        }
        return node
    end

    # performs autocomplete for the current path by traversing down the trie
    def autocomplete(curr_node, curr_path, word_list)
        if curr_node.is_word
            word_list.append(curr_path)
        end

        puts word_list
        curr_node.children.each { |c| 
            child = node.get_char(c)
            autocomplete(child, curr_path + child.val, word_list)
            node = child
        }
    end

    # perform autocomplete starting with the prefix
    def findWords(prefix)
        prefix_node = search(prefix)
        unless prefix_node?
            return []
        end
        
        puts prefix_node
        words = []

        # autocomplete(prefix_node, prefix, words)
        # puts words

        words
    end

    def get_children()
        return @root.children
    end
end