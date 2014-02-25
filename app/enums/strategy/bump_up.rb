# http://math-magic.com/multiply_stategies/mult_last_add_10.htm
class Strategy::BumpUp < Strategy
  def name
    'Bump Up'
  end

  def hint
    ''
  end

  LOWER_LIMIT = 20
  UPPER_LIMIT = 360 # Assuming kids memorize squares up to 35


  #@param q [Question::Multiplication]
  def question_qualifies?(q)
    qualifies = false

    if q.is_a? Question::Multiplication
      a = q.left.to_i
      b = q.right.to_i

      if  LOWER_LIMIT < a and a < UPPER_LIMIT and
          LOWER_LIMIT < b and b < UPPER_LIMIT
        a_tens = a / 10
        b_tens = b / 10
        a_ones = a % 10
        b_ones = b % 10
        if a_tens == b_tens and a_ones + b_ones == 10
          qualifies = true
        end
      end
    end
    qualifies
  end

  # @override
  def possible_questions
    Question::Multiplication.all
  end

end
