# frozen_string_literal: true

# https://www.codewars.com/kata/51e056fe544cf36c410000fb
# Most frequently used words in a text

# Write a function that, given a string of text (possibly with punctuation and line-breaks),
# returns an array of the top-3 most occurring words, in descending order of the number of occurrences.

def top_3_words(text)
  freq = {}
  text.gsub(%r{[,./]|(?:\W)'}, '').split.map(&:downcase).each do |word|
    freq[word] = freq.fetch(word, 0) + 1
  end
  top = []
  freq.sort_by { |_, v| -v }[0..2].each { |pair| top << pair[0] }
  # return freq.select {|k, v| v > 1}
  top
end

puts top_3_words(
  'In a village of La Mancha, the name of which I have no desire to call to
  mind, there lived not long since one of those gentlemen that keep a lance
  in the lance-rack, an old buckler, a lean hack, and a greyhound for
  coursing. An olla of rather more beef than mutton, a salad on most
  nights, scraps on Saturdays, lentils on Fridays, and a pigeon or so extra
  on Sundays, made away with three-quarters of his income.'
).to_s
