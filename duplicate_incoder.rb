# https://www.codewars.com/kata/54b42f9314d9229fd6000d9c
# The goal of this exercise is to convert a string to a new string 
# where each character in the new string is "(" if that 
# character appears only once in the original string, or ")" if that 
# character appears more than once in the original string. 
# Ignore capitalization when determining if a character is a duplicate.

# Examples

#"din"      =>  "((("
#"recede"   =>  "()()()"
#"Success"  =>  ")())())"
#"(( @"     =>  "))((" 

# 1 solution

def duplicate_encode(word)
  chars = word.downcase.chars
  count_chars = chars.each_with_object(Hash.new 0) { |c, h| h[c] += 1 }
  chars.map { |c| count_chars[c] > 1 ? ')' : '(' }.join
end

# 2 solution

def duplicate_encode(word)
  word.upcase.chars.map{|c| word.upcase.count(c) > 1 ? ')' : '('}.join
end
