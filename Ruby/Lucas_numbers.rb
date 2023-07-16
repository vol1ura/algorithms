# frozen_string_literal: true

# https://www.codewars.com/kata/55a7de09273f6652b200002e/ruby
# Lucas numbers are numbers in a sequence defined like this:

# L(0) = 2
# L(1) = 1
# L(n) = L(n-1) + L(n-2)

# Your mission is to complete the function that returns the nth term of this sequence.

# NOTE: It should work for negative numbers as well; how you do this is you flip the equation around, so for negative numbers: L(n) = L(n+2) - L(n+1)

# 1 solution - recurrent

def lucasnum1(n)
  return 2 if n.zero?
  return 1 if n == 1

  l0, l1 = 2, 1
  if n.positive?
    2.upto(n) { l0, l1 = l1, l0 + l1 }
    l1
  else
    n.upto(-1) { l0, l1 = l1 - l0, l0 }
    l0
  end
end

# 2 solution - recursive with memoize

@cache = Hash.new(nil)

def lucasnum2(n)
  return 2 if n.zero?
  return 1 if n == 1
  return @cache[n] if @cache.member?(n)

  @cache[n] = n.positive? ? lucasnum(n - 1) + lucasnum(n - 2) : lucasnum(n + 2) - lucasnum(n + 1)
  @cache[n]
end

# Examples

# L(-10) = 123
# L(-5)  = -11
# L(-1)  =  -1
# L(0)   =   2
# L(1)   =   1
# L(5)   =  11
# L(10)  = 123
