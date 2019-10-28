from math import sqrt
from typing import Generator


def prime_generator(limit: int) -> Generator[int, None, int]:
    if limit < 2:
        return
    else:
        yield 2
    primes = [2]
    for x in range(3, limit + 1, 2):
        if any(map(lambda divisor: x % divisor == 0, primes[: int(sqrt(x))])):
            continue
        else:
            primes.append(x)
            yield x


primes_20 = tuple(prime_generator(20))

primes_two_milliot = prime_generator(2000000)
sum_primes = sum(primes_two_million)
