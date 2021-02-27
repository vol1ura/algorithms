# parseInt() reloaded https://www.codewars.com/kata/525c7c5ab6aecef16e0001a5/python
# In this kata we want to convert a string into an integer. The strings simply represent the numbers in words.
#
# Examples:
#     "one" => 1
#     "twenty" => 20
#     "two hundred forty-six" => 246
#     "seven hundred eighty-three thousand nine hundred and nineteen" => 783919
#
# Additional Notes:
#     The minimum number is "zero" (inclusively)
#     The maximum number, which must be supported is 1 million (inclusively)
#     The "and" in e.g. "one hundred and twenty-four" is optional, in some cases it's present and in others it's not
#     All tested numbers are valid, you don't need to validate them
import re


numbers = {'one': 1, 'two': 2, 'three': 3, 'four': 4, 'five': 5, 'six': 6, 'seven': 7, 'eight': 8, 'nine': 9, 'ten': 10,
           'eleven': 11, 'twelve': 12, 'thirteen': 13, 'fourteen': 14, 'fifteen': 15, 'sixteen': 16, 'seventeen': 17,
           'eighteen': 18, 'nineteen': 19, 'twenty': 20, 'thirty': 30, 'forty': 40, 'fifty': 50, 'sixty':60, 'seventy': 70,
           'eighty': 80, 'ninety': 90}


def parse99(str_h: str) -> int:
    return sum(numbers[str_part] for str_part in re.split('-| ',str_h.strip()))


def parse_int(number_str: str) -> int:
    print(number_str)
    if number_str == 'zero':
        return 0
    if number_str == 'one million':
        return 1000000
    number_int = 0
    thousands = re.split('thousand', re.sub(' and ', ' ', number_str))
    for t in range(len(thousands)):
        hundreds = re.split('hundred', thousands[t])
        for h in range(len(hundreds)):
            if hundreds[h].strip() == '':
                continue
            number_int += 1000 ** (len(thousands) - t - 1) * 100 ** (len(hundreds) - h - 1) * parse99(hundreds[h])
    return number_int


print(parse_int("two hundred forty-six"))
