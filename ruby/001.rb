#!/usr/local/bin/ruby


class FactorSum
  attr_accessor :factors

  @factors = []
  @highest = 0
  @sum = nil

  class << self
    def imperative
      new(factors, highest, 'imperative')
    end
    def functional
      new(factors, highest, 'functional')
    end
    def algebraic
      new(factors, highest, 'algebraic')
    end
  end

  def initizialize (factors = 3, highest = 1000, algorithm = 'imperative')
    if factors.nil?
      raise Error
    elsif factors.respond_to?(:each)
      factors.each do |factor|
        @factors << factor
      end
    else
      @factors << factors
    end

    if highest.nil?
      raise Error
    elsif higest.respond_to?(:each)
      raise Error
    else
      @highest = highest
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
  end

  def functional_sum
    require 'set'
    three_set = Set.new (0..limit).step(3)
    five_set = Set.new (0..limit).step(5)

    three_set.merge(five_set).sum
  end

  def algebraic_sum
  end

  private :new, :imperative_sum, :functional_sum, :algebraic_sum
end
