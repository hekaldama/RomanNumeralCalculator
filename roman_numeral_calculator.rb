class RomanNumeralCalculator

  FIXNUM_TO_ROMAN = {
    1  => 'I',
    5  => 'V',
    10 => 'X',
  }

  ROMAN_TO_FIXNUM = {
    'i' => 1,
    'v' => 5,
    'x' => 10,
    'l' => 50,
    'c' => 100,
    'd' => 500,
    'm' => 1000
  }

  def self.calculate input
    new(input).calculate
  end

  attr_reader :input

  def initialize input
    @input = input
  end

  def calculate
    raise ArgumentError unless is_roman?

    # convert roman to integer
    if input.to_i == 0
      total = 0
      input.each_char do |e|
        total += translate_roman_char_to_fixnum e
      end
      total
    else
      ROMAN_TO_FIXNUM.values.reverse.each do |i|
        val = input / i
        next if val == 0
        a = FIXNUM_TO_ROMAN[i] * val
        return a
      end
    end
  end

  def is_roman?
    !(input =~ /[^ivxlcdm]/i)
  end

  # TODO privitize
  def translate_roman_char_to_fixnum char
    ROMAN_TO_FIXNUM[char.downcase]
  end

end

