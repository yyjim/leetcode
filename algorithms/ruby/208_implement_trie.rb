class TrieNode
    # Initialize your data structure here.
    attr_accessor :is_word, :leaves
    def initialize
        @is_word = false
        @leaves = []
    end
end

class Trie
    def initialize
        @root = TrieNode.new
    end

    # @param {string} word
    # @return {void}
    # Inserts a word into the trie.
    def insert(word)
        node = @root;
        word.each_byte do |s|
            index = s - 97
            unless node.leaves[index]
              node.leaves[index] = TrieNode.new              
            end
            node = node.leaves[index]
        end
        node.is_word = true
    end

    # @param {string} word
    # @return {boolean}
    # Returns if the word is in the trie.
    def search(word)
      node = search_node_with(word)
      return node ? node.is_word : false
    end

    # @param {string} prefix
    # @return {boolean}
    # Returns if there is any word in the trie
    # that starts with the given prefix.
    def starts_with(prefix)
      return !!search_node_with(prefix)
    end
    
    def search_node_with(string)
      node = @root;
      string.each_byte do |s|
          index = s - 97
          if !node.leaves[index]
            return nil
          end
          node = node.leaves[index]
      end
      return node
    end
end

# Your Trie object will be instantiated and called as such:
trie = Trie.new
trie.insert('abcc')
trie.insert("somestring")
trie.search("key")