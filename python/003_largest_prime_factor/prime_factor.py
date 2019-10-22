from typing import Generator


def _factor_generator(number: int) -> Generator:
    if number % 2 == 0:
        number = number / 2
        yield 2

    cursor = 3
    while cursor <= number:
        if number % cursor == 0:
            yield cursor
            number = number / cursor
        else:
            cursor = cursor + 2


def main():
    _number = 13195
    _generator = _factor_generator(_number)
    return list(_generator)[-1]


if __name__ == "__main__":
    print(main())
