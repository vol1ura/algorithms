# https://www.codewars.com/kata/529bf0e9bdf7657179000008
# Write a function validSolution/ValidateSolution/valid_solution() 
# that accepts a 2D array representing a Sudoku board, and returns true 
# if it is a valid solution, or false otherwise. 
# The cells of the sudoku board may also contain 0's, which will represent empty cells. 
# Boards containing one or more zeroes are considered to be invalid solutions.
# The board is always 9 cells by 9 cells, and every cell only contains integers from 0 to 9.

def valid_solution(board)
  return false if board.flatten.include? 0
  
  valid_set = Set[1,2,3,4,5,6,7,8,9]
  
  [0, 3, 6].all? do |i|
    [0, 3, 6].all? do |j|
      (0+i..2+i).map { |k| board[k][0+j..2+j]}.flatten.to_set == valid_set
    end
  end &&
    board.all? {|row| row.to_set == valid_set } &&
    board.transpose.all? {|row| row.to_set == valid_set }
end
