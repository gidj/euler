# -*- coding: utf-8 -*-

"""
Multiples of 3 and 5
Problem 1
If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

Find the sum of all the multiples of 3 or 5 below 1000.
"""

import sys
import argparse

def imperative_sum(limit):
    def _divisible_by_3_or_5(num):
        return num % 3 == 0 or num % 5 == 0

    total = 0
    for number in xrange(limit):
        if _divisible_by_3_or_5(number):
            total += number

    return total

def functional_sum(limit):
    number_list = [ number for number in xrange(limit) \
                    if number % 3 == 0 or number % 5 == 0 ]
    total = sum(number_list)
    return total

def main(argv):
    description = "Calculate the sum of all numbers that are divisible by " \
            "either 3 or 5 up to a limit"
    parser = argparse.ArgumentParser(description=description)
    group = parser.add_mutually_exclusive_group()
    group.add_argument("-i", "--imperative",
            help="Use the imperative method",
            action="store_true")
    group.add_argument("-f", "--functional",
            help="Use the functional method",
            action="store_true")
    parser.add_argument("-l", "--limit",
            help="Indicate the upper limit of the list; defaults to 1000",
            type=int, default=1000)
    parser.add_argument("-v", "--verbose",
            help="Verbose mode",
            action="store_true")

    args = parser.parse_args()

    f = functional_sum if args.functional else imperative_sum
    msg = "The total is {}" if args.verbose else "{}"

    print msg.format( f(args.limit) )


if __name__ == "__main__":
    main(sys.argv)
