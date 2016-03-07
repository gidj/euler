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
    if factors.respond_to?(:each)
      factors.each do |factor|
        @factors << factor
      end
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
    (0..@limit).each do |number|
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
      multiples_set.merge((0..@limit).step(factor))
    end

    multiples_set.to_a.reduce(0, :+)
  end

  def algebraic_sum
    factor_sum_array = []
    @factors.each do |factor|
      factor_sum_array << (factor * (factor + 1)) / 2
    end

    overcount_array = []
    (2..@factors.length).each do |number|
      @factors.combination(number).each do |combination|
        overcount_array << (combination.length-1) * combination.reduce(1, :*)
      end
    end

    return factor_sum_array.reduce(0, :+) - overcount_array.reduce(0, :+)
  end

  # private :imperative_sum, :functional_sum, :algebraic_sum
end
