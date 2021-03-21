import time


# Decorator to display elapsed computational time
def elapsed(func):
    def wrapper(*args):
        t = time.time()
        result = func(*args)
        print(f'Elapsed time: {(time.time() - t) * 1000000: .2f} microseconds.')
        return result
    return wrapper


# Recurrent method. We assume that n is nonnegative integer
@elapsed
def fibonacci(n: int) -> int:
    if n == 0:
        return 0
    elif n == 1:
        return 1
    fib0, fib1 = 0, 1
    n = n - 1
    while n > 0:
        fib0, fib1 = fib1, fib1 + fib0
        n -= 1
    return fib1


# Recursive algorithm
def fibonacci_r(n: int) -> int:
    if n == 0:
        return 0
    elif n == 1:
        return 1
    return fibonacci_r(n - 1) + fibonacci_r(n - 2)


# Memoization method
class FibonacciNumbers:
    def __init__(self):
        self.__cache = {}

    def calculate(self, n: int) -> int:
        if n in self.__cache:
            return self.__cache[n]
        if n == 1 or n == 2:
            value = 1
        else:
            value = self.calculate(n - 1) + self.calculate(n - 2)
        self.__cache[n] = value
        return value

# lru_caching
from functools import lru_cache

@lru_cache(maxsize=1000)
def fibonacci_lru(n):
    if n == 1 or n == 2:
        return 1
    else:
        return fibonacci_lru(n - 1) + fibonacci_lru(n - 2)


N = 40

print(f'Recurrent computation of F({N}) = {fibonacci(N)}.\n')
print(f'Recursive computation of F({N}) = {elapsed(fibonacci_r)(N)}.\n')
fib = FibonacciNumbers()
print(f'Computation with memoization F({N}) = {elapsed(fib.calculate)(N)}.\n')
print(f'Computation with lru cache F({N}) = {elapsed(fibonacci_lru)(N)}.')

# Elapsed time:  8.58 microseconds.
# Recurrent computation of F(40) = 102334155.
#
# Elapsed time:  33428232.19 microseconds.
# Recursive computation of F(40) = 102334155.
#
# Elapsed time:  54.84 microseconds.
# Computation with memoization F(40) = 102334155.
#
# Elapsed time:  15.74 microseconds.
# Computation with lru cache F(40) = 102334155.
