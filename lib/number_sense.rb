module NumberSense
  class Number

  end

  class Decimal < Number

  end

  class WholeNumber < Number

  end

  class Fraction < Number
    @numerator = 0
    @denominator = 1
  end

  class ComplexNumber < Number

  end



    class Decimal < ActiveRecord::Base
      def value
        to_s.to_i
      end

      def to_s
        "#{value + repeat}#{repeat.to_s.gsub(/0\./, '') * 3}"
      end

      def self.random_new
        a = rand(100)
        b = rand(100) / 100.0
        self.new(non_repeat: a, repeat: b)
      end
    end

    class Decimal < ActiveRecord::Base
      attr_accessible :numerator, :denominator

      def to_f
        numerator / denominator
      end

      def to_s
        to_f.to_s
      end

      def self.random_new
        a = rand(100) # etc
        b = random_prime(...) # etc etc
        self.new(numerator: a, denominator: b)
      end
    end


end