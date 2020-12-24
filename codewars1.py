"""
Sum by Factors https://www.codewars.com/kata/54d496788776e49e6b00052f/python

Given an array of positive or negative integers
I= [i1,..,in]
you have to produce a sorted array P of the form
[ [p, sum of all ij of I for which p is a prime factor (p positive) of ij] ...]
P will be sorted by increasing order of the prime numbers. The final result has to be given as a string in Java, C#, C,
C++ and as an array of arrays in other languages.

Example:
I = [12, 15] # result = [[2, 12], [3, 27], [5, 15]]
[2, 3, 5] is the list of all prime factors of the elements of I, hence the result.

Notes:
    It can happen that a sum is 0 if some numbers are negative!
Example: I = [15, 30, -45] 5 divides 15, 30 and (-45) so 5 appears in the result, the sum of the numbers for which 5 is
a factor is 0 so we have [5, 0] in the result amongst others.
"""


def p_factor(a):
    primes = []
    p = 2
    d = abs(a)
    while p * p <= abs(a):
        while d % p == 0:
            primes.append(p)
            d = d // p
        p += 1
    primes.append(d)
    return set(primes).difference({1})


def sum_for_list(lst):
    I = [[a, p_factor(a)] for a in lst]
    P = set()
    for i in I:
        P = P.union(i[1])
    return sorted([[p, sum(i[0] for i in I if p in i[1])] for p in P])


a = [12, 15]
print(sum_for_list(a))
