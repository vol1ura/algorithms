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


N = 10

print(f'Recurrent computation of F({N}) = {fibonacci(N)}.')
t = time.time()
result = fibonacci_r(N)
print(f'Elapsed time: {(time.time() - t) * 1000000: .2f}')
print(f'Recursive computation of F({N}) = {result}.')

# Elapsed time:  3.58 microseconds.
# Recurrent computation of F(10) = 55.

# Elapsed time:  33.86
# Recursive computation of F(10) = 55.
