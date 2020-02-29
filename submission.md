# Lexicali

## Anagram

My implementation for this algorithm was especially involved in the creation of a hash table for the object `anagram` in the `Lexicon` class. This `anagram` was a mapping of character frequencies to the words themselves. This was especially helpful for grouping all anagrams together since, by definition, if two words are anagrams of each other, they have the same character frequencies. 

Therefore, this hash table was constructed upon startup and when it came to acquiring all possible anagrams for a user input itself, the time complexity would be essentially equivalent to generating the character counts of an input and performing a `O(1)` table lookup.

## Prefixed Words

My implementation for this algorithm was essentially constructing a Trie since they are perfect for dealing with autocomplete and prefixes, which are essentially the cruxes of this question. Each word is passed along the trie and thus, finding all words beginning with a prefix would be some sort of tree traversal starting with the end of the prefix as the root. As all tree traversals tend to go, this was a recursive implementation on the node's children, and so on. 

Clearly, this is faster than a typical `O(n)` implementation since we've already condensed our search criteria with this tree structure, starting off at the end of the prefix as the root.

## Word Ladder

I thought of implementing some sort of breadth-first search on our dictionary, with the queue first containing `start_word`. To make things simpler, I created a `Word` object in order to keep track of the current ladder for each `Word` node. I would pop the first element in the queue and traverse through every combination of every letter in the alphabet and each letter in the current word in order to look for our next word candidate. The next word would be its own `Word` object, added onto the queue and the process would repeat. Generating the word ladder once we've reached `end_word` would be trivial (accessing the `path` field in our class) since we would have already kept track of the word ladder along the way.

