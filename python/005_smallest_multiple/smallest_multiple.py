from collections import Counter
from functools import reduce
from operator import mul
from typing import Generator

_range = tuple(range(2, 21))


def _factor_generator(number: int) -> Generator:
    while number % 2 == 0:
        number = number / 2
        yield 2
    cursor = 3
    while cursor <= number:
        if number % cursor == 0:
            yield cursor
            number = number / cursor
        else:
            cursor = cursor + 2


factors = tuple(map(tuple, map(_factor_generator, _range)))

counters = tuple(map(Counter, factors))

final_count = reduce(lambda x, y: x | y, counters)

smallest_multiple = reduce(mul, [prime ** power for prime, power in final_count.items()])
