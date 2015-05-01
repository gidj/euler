# -*- coding: utf-8 -*-

"""
Multiples of 3 and 5
Problem 1
If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

Find the sum of all the multiples of 3 or 5 below 1000.
"""

import sys

def iterative_version(limit):
    def _divisible_by_3_or_5(num):
        return num % 3 == 0 or num % 5 == 0

    total = 0
    for number in xrange(limit):
        if _divisible_by_3_or_5(number):
            total += number

    return total

def functional_version(limit):
    number_list = [ number for number in xrange(limit) if number % 3 == 0 or number % 5 == 0 ]
    total = sum(number_list)
    return total

def main(argv):
    if len(argv) > 1:
        LIMIT = int(argv[1])
    else:
        LIMIT = 1000

    total = iterative_version(LIMIT)

    print "The total is {}".format(total)

if __name__ == "__main__":
    main(sys.argv)
