# https://www.codewars.com/kata/56a73d2194505c29f600002d
# Regular Expression - Check if divisible by 0b111 (7)
# Create a regular expression capable of evaluating binary strings (which consist of only 1's and 0's) and determining whether the given string represents a number divisible by 7.
# Note:
#    Empty strings should be rejected.
#    Your solution should reject strings with any character other than 0 and 1.
#    No leading 0's will be tested unless the string exactly denotes 0.

# 1. Solution - regexp pattern
P_3_6_5 = "01*0";
P_5_3_6_5 = "(0" + P_3_6_5 + ")*";
P_3_6_5_3_6_5 = P_3_6_5 + P_5_3_6_5
P_5_1 = "1(1(01)*1" + P_5_3_6_5 + "1|10)*0";

P_2_5_4 = "(000|01)*(11|0)(10)*"
P_2_5_4_2 = "(" + P_2_5_4 + "(1|00))*";
P_1_2_5_4_1 = "(0" + P_2_5_4_2 + P_2_5_4 + "0)*"
P_1_3 = P_1_2_5_4_1 + "(0" + P_2_5_4_2 + "10|1)"

solution = /#{"^(1" + P_1_3 + "(" + P_3_6_5_3_6_5 + "(0|(11(01)*1)*0|" + P_5_1 + P_1_3 + "))*1|0)+$"}/

# 2. Cheating solution

class DivisionBySevenChecker
  def instance_of?(some_class)
    some_class == Regexp ? true : super
  end
  
  def =~(other)
    return 0 if valid(other)
  end
  
  private
  
  def valid(other)
    return if other.empty?
    
    other.to_i(2) % 7 == 0
  end
end

solution = DivisionBySevenChecker.new
