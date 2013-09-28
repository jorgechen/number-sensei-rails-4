################################################
## Barracks contain factory methods
################################################
module Barracks

  # Builds everything with the given configuration hash
  def self.build_all(cfg)

    if (list = cfg[:exponential])
      puts 'Exponentials'
      list.each do |h|
        Barracks.build_exponential(h[:lower_base], h[:upper_base], h[:power])
      end
    end

    if (list = cfg[:roman_numeral])
      puts 'Roman Numerals'
      list.each do |h|
        Barracks.build_roman_numeral(h[:lower], h[:upper])
      end
    end

  end

  # 2 factor multiplication
  # @param a_start [Integer] smallest number for 1st factor
  # @param a_end   [Integer] biggest number for 1st factor
  # @param b_start [Integer] smallest number for 2nd factor
  # @param b_end   [Integer] biggest number for 2nd factor
  def self.build_multiplication(a_start, a_end, b_start, b_end)
    (a_start..a_end).each do |i|
      (b_start..b_end).each do |j|
        q = Question::Multiplication.build i, j
        q.save
        #puts "id#{q.id}\t#{q.to_s}"
      end
    end
  end

  # Builds exponential questions for a range of the base
  # @param base_start [Integer] lower bound of base
  # @param base_end   [Integer] upper bound of base
  # @param power      [Integer] the exponent part
  def self.build_exponential(base_start, base_end, power)
    (base_start..base_end).each do |b|
      q = Question::Exponential.build(b, power)
      q.save
      #puts "#{q.to_s}"
    end
  end

  # @param lower [Integer]
  # @param upper [Integer]
  def self.build_roman_numeral(lower, upper)
    (lower..upper).each do |b|
      q = Question::RomanNumeral.build(b)
      q.save
      #puts "#{q.to_s}"
    end
  end

  # @param lower [Integer]
  # @param upper [Integer]
  def self.build_arabic_to_roman_numeral(lower, upper)
    (lower..upper).each do |b|
      q = Question::ArabicToRomanNumeral.build(b)
      q.save
      puts "#{q.to_s}"
    end
  end

end