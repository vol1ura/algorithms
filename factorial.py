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
def factorial(n: int) -> int:
    result = 1
    while n > 0:
        result *= n
        n -= 1
    return result


# Recursive algorithm
def factorial_r(n: int) -> int:
    if n == 0:
        return 1
    return n * factorial_r(n - 1)


N = 10
print(f'Reccurent method: {N}! = {factorial(N)}.')
print(f'Recursive method: {N}! = {elapsed(factorial_r)(N)}.')

N = 500
print(f'Reccurent method: {N}! = {factorial(N)}.')
print(f'Recursive method: {N}! = {elapsed(factorial_r)(N)}.')

# Elapsed time:  7.63 microseconds.
# Reccurent method: 10! = 3628800.
# Elapsed time:  3.58 microseconds.
# Recursive method: 10! = 3628800.
