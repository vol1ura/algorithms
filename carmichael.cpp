#include <map>
#include <math.h>
#include <vector>

long long lambda(std::pair<long long, int> x) {
  if(x.second == 0) return 1;
  if(x.second == 1) return x.first - 1;
  long long n = 1;
  for(int i = 0; i < x.second - 1; ++i) {
    n *= x.first;
  }
  long long m = n * (x.first - 1);
  if(x.first == 2 && x.second > 2) m /= 2;
  return m;
}

std::vector<long long> primes(long long n) {
  std::vector<long long> arrOfPrimes;
  std::vector<bool> isprime(n + 1, true);
  arrOfPrimes.push_back(2);
  long long i = 3;
  
  while(i * i <= n) {
    if(isprime[i]) {
      arrOfPrimes.push_back(i);
      long long j = i * i;
      while(j <= n) {
        isprime[j] = false;
        j += 2 * i;
      }
    }
    i += 2;
  }
  
  for(i = (n < 9)?3:*(arrOfPrimes.end() - 1) + 2; i <= n; i += 2) {
    if(isprime[i]) arrOfPrimes.push_back(i);
  }
  return arrOfPrimes;
}

long long gcd(long long a, long long b) {
  while(a * b != 0) {
    if(a > b) std::swap(a,b);
    b %= a;
  }
  return (a == 0)?b:a;
}


std::map<long long, int> decomp (long long n, std::vector<long long> arrOfPrimes) {
  std::map<long long, int> dec;
  for(auto it = arrOfPrimes.begin(); it != arrOfPrimes.end() && n != 1; ++it) {
    int k = 0;
    while((n > 1) && (n % *it == 0)) {
      n /= *it;
      dec[*it] = ++k;
    }
  }
  if(n != 1) {
    dec[n] = 1;
  }
  return dec;
}

long long Carmichael(long long n)
{
  std::cerr << " ====== " << n << " ======\n";
  clock_t start, end;
  
  if(n < 1) return 0;
  if(n == 1 || n == 2) return 1;

  auto arrOfPrimes = primes(ceil(sqrt((double)n)));
  end = clock();
  auto d = decomp(n, arrOfPrimes);
  
  start = clock();
  std::vector<long long> lam_p;
  for(auto it = d.begin(); it != d.end(); ++it) {
    std::cerr << (*it).first << " " << (*it).second << std::endl;
    lam_p.push_back(lambda(*it));
  }

  long long lcm = lam_p[0];
  for(int i = 1; i < lam_p.size(); ++i) {
    if(lam_p[i] != 1) lcm *= lam_p[i] / gcd(lam_p[i], lcm);
  }
  std::cerr << "Carmichael value: " << lcm << std::endl;
 
  return lcm;
}
