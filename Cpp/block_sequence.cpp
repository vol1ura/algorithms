/*
https://www.codewars.com/kata/5e1ab1b9fe268c0033680e5f/cpp
Consider the following array:
[1, 12, 123, 1234, 12345, 123456, 1234567, 12345678, 123456789, 12345678910, 1234567891011...]

If we join these blocks of numbers, we come up with an infinite sequence which starts with 112123123412345123456....
The list is infinite.

You will be given an number (n) and your task will be to return
the element at that index in the sequence, where 1 ≤ n ≤ 10^18.
Assume the indexes start with 1, not 0. For example:

solve(1) = 1, because the first character in the sequence is 1. There is no index 0.
solve(2) = 1, because the second character is also 1.
solve(3) = 2, because the third character is 2.
*/
#include <string>

int solve(long long n) {
  long long i = 1, len = 0, tmp_len = 0, delta = 1, ord = 10;
  while(len < n) {   // fast loop
    if(i++ >= ord) {
      ord *= 10;
      delta++; }
    tmp_len += delta;
    len += tmp_len;
  }
  long long len0 = 0, s = n - len + tmp_len;
  i = 1, ord = 10, delta = 1;
  while(len0 < s) {   // slow loop
    if(i++ >= ord) {
      ord *= 10;
      delta++;
    }
    len0 += delta;
  }
  return (int)(std::to_string(i-1)[s-len0+delta-1]-'0');
}