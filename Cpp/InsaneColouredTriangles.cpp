// Insane Coloured Triangles
// https://www.codewars.com/kata/5a331ea7ee1aae8f24000175
// This is my Ruby solution rewrited to C++ to pass all hard test. Ruby interpreter was too slow.

#include <map>
#include <math.h>
#include <vector>
#include <string>

std::vector<int> conv_base_3(int n) {
  std::vector<int> conv;
  do {
    conv.push_back(n % 3);
    n /= 3;
  } while(n > 0);
  return conv;
}

int binom_max_2(int n, int k) {
  if(n < k) return 0;
  if(n == 0 || n == 1) return 1; 
  if(k == 0 || k == 2) return 1;
  return 2;
}

int lucas_3(int k, std::vector<int> dig_m) {
  std::vector<int> dig_k = conv_base_3(k);
  int prod = 1;
  for(int i = 0; i < dig_k.size(); i++) {
    prod *= binom_max_2(dig_m[i], dig_k[i]);
    prod %= 3;
  }
  return prod % 3;
}

std::map<char, int> let_2_int { {'R', 0}, {'G', 1}, {'B', 2} };
std::map<int, char> int_2_let { {0, 'R'}, {1, 'G'}, {2, 'B'} };

char triangle(const std::string &row)
{
  int n = row.length();
  std::vector<int> dig_n = conv_base_3(n - 1);
  int res = 0;
  int k = 0;
  while(k < n / 2) {
    res += (let_2_int[row[k]] + let_2_int[row[n-k-1]]) * lucas_3(k, dig_n);
    k += 1;
  }
  
  if(n % 2) {
    res += let_2_int[row[n/2]] * lucas_3(n/2, dig_n);
  } else {
    res = (-1 * res) % 3 + 3;
  }
  
  return int_2_let[res % 3];
}
