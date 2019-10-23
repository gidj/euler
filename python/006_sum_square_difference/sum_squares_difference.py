number = 100
sum_squares = sum(map(lambda x: x * x, range(number + 1)))

square_sums = sum(range(number + 1)) ** 2

print(square_sums - sum_squares)
