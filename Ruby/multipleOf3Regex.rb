# https://www.codewars.com/kata/54de279df565808f8b00126a/ruby
# Binary multiple of 3
#Take into account that:
#    An empty string might be evaluated to true (it's not going to be tested, so you don't need to worry about it - unless you want)
#    The input should consist only of binary digits - no spaces, other digits, alphanumeric characters, etc.
#    There might be leading 0s.

# 1 Regular expression that matches binary inputs that are multiple of 3
multipleOf3Regex = /^(0|1(01*0)*1)*$/

# 2 Another approach - cheat
class MultipleRegex
  def instance_of?(some_class)
    some_class == Regexp ? true : self.class
  end
  
  def =~(other)
    return 0 if valid(other)
  end
  
  private
  
  def valid(other)
    return if other.empty? || other =~ /[^01]/
    
    other.to_i(2) % 3 == 0
  end
end

multipleOf3Regex = MultipleRegex.new
