from itertools import combinations_with_replacement
from operator import mul

three_digit_numbers = tuple(range(100, 1000))

combinations = combinations_with_replacement(three_digit_numbers, 2)

products = [mul(*x) for x in combinations]

max_palindrome = max([x for x in products if str(x)[::-1] == str(x)])
