#!/usr/local/bin/ruby


class FactorSum
  attr_accessor :factors

  class << self
    def imperative
      new(factors, limit, 'imperative')
    end
    def functional
      new(factors, limit, 'functional')
    end
    def algebraic
      new(factors, limit, 'algebraic')
    end
  end

  def initizialize (factors = 3, limit = 1000, algorithm = 'imperative')
    if factors.nil?
      raise Error
    elsif factors.respond_to?(:each)
      factors.each do |factor|
        @factors << factor
      end
    else
      @factors << factors
    end

    if limit.nil?
      raise Error
    elsif higest.respond_to?(:each)
      raise Error
    else
      @limit = limit
    end

    case algorithm
    when 'imperative' then @sum = imperative_sum
    when 'functional' then @sum = functional_sum
    when 'algebraic' then @sum = algebraic_sum
    else @sum = algebraic_sum
    end
  end

  def imperative_sum
    total = 0
    (0..@limit).each do |number|
      is_divisible = false
      @factors.each do |factor|
        is_divisible &= number % factor
      end

      if is_divisible
        total += number
      end
    end

    total
  end

  def functional_sum
    require 'set'
    multiples_set = Set.new

    @factors.each do |factor|
      mutiples_set.merge((0..@limit).step(factor))
    end

    multiples_set.sum
  end

  def algebraic_sum
  end

  private :new, :imperative_sum, :functional_sum, :algebraic_sum
end
