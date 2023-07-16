# frozen_string_literal: true

# https://www.codewars.com/kata/5a331ea7ee1aae8f24000175

# VERY HARD KATA!

# Examples

# triangle('B') == 'B'
# triangle('GB') == 'R'
# triangle('RRR') == 'R'
# triangle('RGBG') == 'B'
# triangle('RBRGBRB') == 'G'

MAP = { 'R' => 0, 'G' => 1, 'B' => 2 }.freeze

def conv_base_3(n)
  conv = []
  begin
    conv.push(n % 3)
    n /= 3
  end while n.positive?
  conv
end

def binom_max_2(n, k)
  return 0 if n < k
  return 1 if n.zero? || n == 1
  return 1 if k.zero? || k == 2

  2
end

def lucas_3(k, dig_m)
  dig_k = conv_base_3(k)
  prod = 1
  dig_m.zip(dig_k).each do |m, k|
    break if k.nil?

    prod *= binom_max_2(m, k)
    prod %= 3
  end
  prod % 3
end

def triangle(row)
  n = row.length
  dig_n = (n - 1).to_s(3).reverse.chars.map(&:to_i)

  res = k = 0
  while k < n / 2 do
    res += (MAP[row[k]] + MAP[row[n - k - 1]]) * lucas_3(k, dig_n)
    k += 1
  end
  res += MAP[row[n / 2]] * lucas_3(n / 2, dig_n) if n.odd?
  res *= -1 if n.even?

  MAP.invert[res % 3]
end


triangle('RBRGBRBGGRRRBGBBBGG') # == 'G'
