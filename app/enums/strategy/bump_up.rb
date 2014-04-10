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


  #@param question [Question::Multiplication]
  def question_qualifies?(question)
    qualifies = false

    if question.is_a? Question::Multiplication and question.is_both_in_range?(LOWER_LIMIT, UPPER_LIMIT)
      a = question.left.to_i
      b = question.right.to_i
      if a / 10 == b / 10 and a % 10 + b % 10 == 10
        qualifies = true
      end
    end

    qualifies
  end

  # @override
  def possible_questions
    Question::Multiplication.all
  end

end
