# frozen_string_literal: true

# https://www.codewars.com/kata/540d0fdd3b6532e5c3000b5b/ruby
# The purpose of this kata is to write a program that can do some algebra.
# Write a function expand that takes in an expression with a single, one character variable, and expands it.
# The expression is in the form (ax+b)^n where a and b are integers which may be positive or negative,
# x is any single character variable, and n is a natural number.
# If a = 1, no coefficient will be placed in front of the variable.
# If a = -1, a "-" will be placed in front of the variable.

class Binom
  def initialize(expr)
    /\((?<a_sign>-)?(?<a>\d+)?(?<x>\w)(?<sign>[+-])(?<b>\d+)\)\^(?<n>\d+)/ =~ expr
    @a = a ? a.to_i : 1
    @a *= -1 if a_sign
    @b = b.to_i
    @b *= -1 if sign == '-'
    @x = x
    @n = n.to_i
  end

  def self.coeffs(n)
    return [1] if n.zero?

    [1] + coeffs(n - 1).each_cons(2).map(&:sum) + [1]
  end

  def expand
    return '1' if @n.zero?

    coeffs.zip(powers).reduce('') { |polynom, coeff| polynom + (coeff.first ? coeff.join : '') }
  end

  private

  def coeffs
    arr = []
    Binom.coeffs(@n).each_with_index do |c, k|
      coeff = c * @a**(@n - k) * @b**k
      if coeff.zero?
        arr << nil
      elsif coeff == 1 && k.zero?
        arr << ''
      elsif coeff == -1 && k < @n
        arr << '-'
      elsif coeff.positive? && k != 0
        arr << "+#{coeff.to_s}"
      else
        arr << coeff.to_s
      end
    end
    arr
  end

  def powers
    @n.downto(1).map { |k| k > 1 ? "#{@x}^#{k}" : @x } + ['']
  end
end

def expand(expr)
  Binom.new(expr).expand
end

# Examples:

expand('(x+1)^2')      # returns "x^2+2x+1"
expand('(p-1)^3')      # returns "p^3-3p^2+3p-1"
expand('(2f+4)^6')     # returns "64f^6+768f^5+3840f^4+10240f^3+15360f^2+12288f+4096"
