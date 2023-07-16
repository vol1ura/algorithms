# frozen_string_literal: true

# Snail Sort
# Given an n x n array, return the array elements arranged from outermost elements to the middle element, traveling clockwise.
# Example:
# array = [[1,2,3],
#          [8,9,4],
#          [7,6,5]]
# snail(array) #=> [1,2,3,4,5,6,7,8,9]

# Loop with rescue solution
def snail1(array)
  seq = []
  loop do
    seq += array.shift
    array.each { |line| seq << line.pop }
    seq += array.pop.reverse
    array.reverse.each { |line| seq << line.shift }
  end rescue seq
end

# Recursive solution
def snail2(array)
  array.empty? ? [] : array.shift + snail(array.transpose.reverse)
end
