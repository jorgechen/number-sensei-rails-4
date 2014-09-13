################################################
## Barracks contain factory methods
################################################
module Barracks

  #@return question configuration read from a file
  def self.data()
    YAML::load_file(File.join(Rails.root, 'db', 'seeds', "questions.#{Rails.env}.yml"))
  end

  # Build all available and missing tricks.
  def self.build_tricks(background_job = nil)
    puts 'Building tricks'
    directory = File.join(Rails.root, 'db', 'seeds', 'guides')

    Strategy.enum_options.each do |s|
      t = Trick.where(strategy: s.enum).first_or_initialize

      # This is an arbitrary number. If questions for this trick is too few, then might as well try to find more. If, in fact, there are only a few questions for this trick (e.g. memorizing Question::Factorial) then the overhead to iterate over them is negligible.
      # Usually we will have 1-3 questions from playing around in the Rails Console.
      threshold = 20

      if t.new_record? or t.questions.count < threshold
        if t.save
          puts t.name
          Armory::assign_questions(t, background_job)
        end
      end

      begin
        file_name = "#{t.name.gsub(' ', '-').underscore}.html"
        file_path = File.join(directory, file_name)
        data = File.read(file_path)
        t.update_attribute :guide, data
      rescue
        puts "Unable to update: #{file_name}"
      end

    end
  end

  # Builds everything with the given configuration hash
  def self.build_all(data, background_job = nil)
    puts 'Barracks is building questions with data:'
    puts data

    if (list = data['factorial'])
      puts 'Factorial'
      list.each do |h|
        Barracks.build_one_factor_question(h, Question::Factorial, background_job)
      end
    end

    if (list = data['exponential'])
      puts 'Exponential'
      list.each do |h|
        Barracks.build_exponential(h, background_job)
      end
    end

    if (list = data['radix_conversion'])
      puts 'Radix conversions'
      list.each do |h|
        Barracks.build_radix_conversion(h, background_job)
      end
    end

    if (list = data['roman_to_arabic_numeral'])
      puts 'Roman Numerals to Arabic'
      list.each do |h|
        Barracks.build_one_factor_question(h, Question::RomanToArabicNumeral, background_job)
      end
    end

    if (list = data['arabic_to_roman_numeral'])
      puts 'Arabic to Roman Numerals'
      list.each do |h|
        Barracks.build_one_factor_question(h, Question::ArabicToRomanNumeral, background_job)
      end
    end

    if (list = data['addition'])
      puts 'Two factor addition'
      list.each do |h|
        Barracks::build_two_factor_question(h, Question::Addition, background_job)
      end
    end

    if (list = data['subtraction'])
      puts 'Two factor subtraction'
      list.each do |h|
        Barracks::build_two_factor_question(h, Question::Subtraction, background_job)
      end
    end

    if (list = data['multiplication'])
      puts 'Two factor multiplication'
      list.each do |h|
        Barracks::build_two_factor_question(h, Question::Multiplication, background_job)
      end
    end

    if (list = data['division'])
      puts 'Two factor division'
      list.each do |h|
        Barracks::build_two_factor_question(h, Question::Division, background_job)
      end
    end

  end


  # Seed a question with a single field
  def self.build_one_factor_question(h, type, background_job)
    lower = h['lower'].to_i
    upper = h['upper'].to_i

    background_job.set_total(upper - lower) if background_job

    (lower..upper).each do |a|
      q = type.build a
      q.skip_trick_assignment = true
      unless q.save
        puts "#{q} ... #{q.errors.messages}"
      end
      background_job.increment!(:progress) if background_job
    end
  end


  # 2 factor addition
  # @param a_start [Integer] smallest number for 1st factor
  # @param a_end   [Integer] biggest number for 1st factor
  # @param b_start [Integer] smallest number for 2nd factor
  # @param b_end   [Integer] biggest number for 2nd factor
  def self.build_two_factor_question(h, type, background_job)
    a_start = h['first_factor']['start'].to_i
    a_end = h['first_factor']['finish'].to_i
    b_start = h['second_factor']['start'].to_i
    b_end = h['second_factor']['finish'].to_i

    a_length = a_end - a_start
    b_length = b_end - b_start
    background_job.set_total(a_length * b_length) if background_job

    (a_start..a_end).each do |a|
      (b_start..b_end).each do |b|
        q = type.build a, b
        q.skip_trick_assignment = true
        unless q.save
          puts "#{q} ... #{q.errors.messages}"
        end
      end
      background_job.increment!(:progress, b_length) if background_job
    end
  end


  # Builds exponential questions for a range of the base
  # @param base_start [Integer] lower bound of base
  # @param base_end   [Integer] upper bound of base
  # @param power      [Integer] the exponent part
  def self.build_exponential(h, background_job)
    base_start = h['lower_base'].to_i
    base_end = h['upper_base'].to_i
    power = h['power']

    if background_job
      base_length = base_end - base_start
      background_job.set_total(base_length)
    end

    (base_start..base_end).each do |b|

      q = Question::Exponential.build(b, power)
      q.skip_trick_assignment = true
      unless q.save
        puts "#{q} ... #{q.errors.messages}"
      end

      background_job.increment!(:progress) if background_job
    end
  end


  # @param decimal_from [Integer]
  # @param decimal_to   [Integer]
  # @param radix_from   [Integer]
  # @param radix_to     [Integer]
  def self.build_radix_conversion(h, background_job)
    decimal_from = h['decimal_from'].to_i
    decimal_to = h['decimal_to'].to_i
    radix_from = h['radix_from'].to_i
    radix_to = h['radix_to'].to_i

    if background_job
      length = decimal_to - decimal_from
      background_job.set_total(length)
    end

    (decimal_from..decimal_to).each do |b|
      q = Question::RadixConversion.build(b, radix_from, radix_to)
      q.skip_trick_assignment = true
      unless q.save
        puts "#{q} ... #{q.errors.messages}"
      end

      background_job.increment!(:progress) if background_job
    end
  end

end