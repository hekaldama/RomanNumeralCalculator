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

  def initialize input
    @input = input
  end

  def calculate
    raise ArgumentError unless valid_input?

    # convert roman to integer
    if @input.is_a? String
      convert_roman_to_numeric
    else
      convert_numeric_to_roman
    end
  end

  private

  def convert_numeric_to_roman
    ROMAN_TO_FIXNUM.values.reverse.each do |i|
      val = @input / i
      next if val == 0
      a = FIXNUM_TO_ROMAN[i] * val
      return a
    end
  end

  def convert_roman_to_numeric
    total = 0
    @input.each_char do |char|
      total += ROMAN_TO_FIXNUM[char.downcase]
    end
    total
  end

  def valid_input?
    !(@input =~ /[^ivxlcdm]/i)
  end

  def break_number_into_parts
    output = []

    @input.to_s.reverse.each_char.with_index do |e,i|
      output << e.to_i * 10**i
    end

    output.reverse
  end

end

