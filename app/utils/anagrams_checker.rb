# require_relative '../extensions/extension_string'

# Anagrams Checker
class AnagramsChecker
 def self.anagrams?(word1, word2)
   return false if word1 == '' || word2 == ''
   return false if word1.length <= 2 || word2.length <= 2
   return false if word1.length != word2.length
   return false if word1.equal?(word2)
   return false if word1.numeric? || word2.numeric?

   word_count_one = word1.chars.sort
   word_count_two = word2.chars.sort
   word_count_one == word_count_two
   # byebug
 end
end
