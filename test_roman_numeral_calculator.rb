require 'rubygems'
require 'minitest/autorun'
require 'minitest/unit'

require 'roman_numeral_calculator'

class RomanNumeralCalculator
  attr_reader :input
end

class RomanNumeralCalculatorTest < MiniTest::Unit::TestCase

  def test_class_calculate_string_input
    assert_equal 3,  RomanNumeralCalculator.calculate('III')
    assert_equal 38, RomanNumeralCalculator.calculate('XXXVIII')
  end

  def test_class_calculate_fixnum_input
    assert_equal 'II', RomanNumeralCalculator.calculate(2)
    assert_equal 'III', RomanNumeralCalculator.calculate(3)
    assert_equal 'X', RomanNumeralCalculator.calculate(10)
    #assert_equal 'IV', RomanNumeralCalculator.calculate(4)
  end

  def test_class_calculate_with_bad_input
    assert_raises ArgumentError do
      RomanNumeralCalculator.calculate "29"
    end

    assert_raises ArgumentError do
      RomanNumeralCalculator.calculate "2"
    end
  end

  def test_init
    input = 123
    rnc = RomanNumeralCalculator.new input
    assert_equal input, rnc.input
  end

end

