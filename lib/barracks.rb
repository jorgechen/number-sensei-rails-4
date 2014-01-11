################################################
## Barracks contain factory methods
################################################
module Barracks

  #@return question configuration read from a file
  def self.data()
    YAML::load_file(File.join(Rails.root, 'db', 'seeds', "questions.#{Rails.env}.yml"))
  end

  # Builds everything with the given configuration hash
  def self.build_all(data)
    puts 'Barracks is building questions with data:'
    puts data

    if (list = data['exponential'])
      puts 'Exponential'
      list.each do |h|
        Barracks.build_exponential(h)
      end
    end

    if (list = data['radix_conversion'])
      puts 'Radix conversions'
      list.each do |h|
        Barracks.build_radix_conversion(h)
      end
    end

    if (list = data['roman_numeral'])
      puts 'Roman Numerals'
      list.each do |h|
        Barracks.build_roman_numeral(h)
      end
    end

    if (list = data['arabic_to_roman_numeral'])
      puts 'Arabic to Roman Numerals'
      list.each do |h|
        Barracks.build_arabic_to_roman_numeral(h)
      end
    end

    if (list = data['multiplication'])
      puts 'Two factor multiplication'
      list.each do |h|
        Barracks::build_multiplication(h)
      end
    end
  end


  # 2 factor multiplication
  # @param a_start [Integer] smallest number for 1st factor
  # @param a_end   [Integer] biggest number for 1st factor
  # @param b_start [Integer] smallest number for 2nd factor
  # @param b_end   [Integer] biggest number for 2nd factor
  def self.build_multiplication(h)
    a_start = h['first_factor']['start'].to_i
    a_end = h['first_factor']['finish'].to_i
    b_start = h['second_factor']['start'].to_i
    b_end = h['second_factor']['finish'].to_i

    (a_start..a_end).each do |i|
      (b_start..b_end).each do |j|
        q = Question::Multiplication.build i, j
        if q.save
          puts "id#{q.id}\t#{q.to_s}"
        end
      end
    end
  end

  # Builds exponential questions for a range of the base
  # @param base_start [Integer] lower bound of base
  # @param base_end   [Integer] upper bound of base
  # @param power      [Integer] the exponent part
  def self.build_exponential(h)
    base_start = h['lower_base'].to_i
    base_end = h['upper_base'].to_i
    power = h['power']

    (base_start..base_end).each do |b|
      q = Question::Exponential.build(b, power)
      if q.save
        puts "#{q.to_s}"
      end
    end
  end

  # @param decimal_from [Integer]
  # @param decimal_to   [Integer]
  # @param radix_from   [Integer]
  # @param radix_to     [Integer]
  def self.build_radix_conversion(h)
    decimal_from = h['decimal_from'].to_i
    decimal_to = h['decimal_to'].to_i
    radix_from = h['radix_from'].to_i
    radix_to = h['radix_to'].to_i

    (decimal_from..decimal_to).each do |b|
      q = Question::RadixConversion.build(b, radix_from, radix_to)
      if q.save
        puts "#{q.to_s}"
      end
    end
  end

  # @param lower [Integer]
  # @param upper [Integer]
  def self.build_roman_numeral(h)
    lower = h['lower'].to_i
    upper = h['upper'].to_i

    (lower..upper).each do |b|
      q = Question::RomanNumeral.build(b)
      if q.save
        puts "#{q.to_s}"
      end
    end
  end

  # @param lower [Integer]
  # @param upper [Integer]
  def self.build_arabic_to_roman_numeral(h)
    lower = h['lower'].to_i
    upper = h['upper'].to_i

    (lower..upper).each do |b|
      q = Question::ArabicToRomanNumeral.build(b)
      if q.save
        puts "#{q.to_s}"
      end
    end
  end


end