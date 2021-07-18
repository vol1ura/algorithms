# Last digit of a huge number
# https://www.codewars.com/kata/5518a860a73e708c0a000027/ruby

# For a given list [x1, x2, x3, ..., xn] compute the last (decimal) digit of x1 ^ (x2 ^ (x3 ^ (... ^ xn))).
# E. g.,
# last_digit({3, 4, 2}, 3) == 1
# because 3 ^ (4 ^ 2) = 3 ^ 16 = 43046721.

def last_digit(list)
  list.reverse.reduce(1) do |n, x|
    if n < 4
      x**n
    else
      x**(n % 4 + 4)
    end
  end % 10
end
