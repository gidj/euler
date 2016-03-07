#!/usr/local/bin/ruby
require 'set'

class FactorSum
  attr_accessor :sum, :factors

  class << self
    private :new
    def imperative(*args)
      new(*args, 'imperative')
    end
    def functional(*args)
      new(*args, 'functional')
    end
    def algebraic(*args)
      new(*args, 'algebraic')
    end
  end

  def initialize(factors, limit, algorithm)
    @factors = []

    is_prime = lambda do |integer|

    end
    prime_factorization = lambda do |integer|
      factor_limit = Math.sqrt(integer).to_i
      prime_list = (2..factor_limit).to_a.select {|x| is_prime.call(x)}
      prime_factors = []
      prime_list.each do |x|
        if integer % x === 0
          prime_factors << x
        end
      end
      return prime_factors
    end

    if factors.nil?
      raise Error
    elsif factors.respond_to?(:each)
      @factors = Set.new(factors.map(prime_factorization).flatten).to_a
    else
      @factors << factors
    end

    if limit.nil?
      raise Error
    elsif limit.respond_to?(:each)
      raise Error
    else
      @limit = limit
    end

    case algorithm
    when 'imperative' then @sum = self.imperative_sum
    when 'functional' then @sum = self.functional_sum
    when 'algebraic' then @sum = self.algebraic_sum
    else @sum = algebraic_sum
    end
  end

  def imperative_sum
    total = 0
    (0..(@limit-1)).each do |number|
      is_divisible = false
      @factors.each do |factor|
        is_divisible |= number % factor === 0
      end

      if is_divisible
        total += number
      end
    end

    total
  end

  def functional_sum
    multiples_set = Set.new

    @factors.each do |factor|
      multiples_set.merge((0..(@limit-1)).step(factor))
    end

    multiples_set.to_a.reduce(0, :+)
  end

  def algebraic_sum
    factor_sum_array = []

    step_sum_to_limit = lambda do |n|
      low_limit = (@limit-1)/n
      n * (low_limit*(low_limit+1)) / 2
    end

    @factors.each do |factor|
      factor_sum_array << step_sum_to_limit.call(factor)
    end

    overcount_array = []
    (2..@factors.length).each do |number|
      @factors.combination(number).each do |combination|
        overcount_factor = combination.reduce(1, :*)
        overcount_array << (combination.length-1) * step_sum_to_limit.call(overcount_factor)
      end
    end

    return factor_sum_array.reduce(0, :+) - overcount_array.reduce(0, :+)
  end

  # private :imperative_sum, :functional_sum, :algebraic_sum
end
