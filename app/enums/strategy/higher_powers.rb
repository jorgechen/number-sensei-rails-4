# http://math-magic.com/multiply_stategies/mult_last_add_10.htm
class Strategy::HigherPowers < Strategy
  def name
    'Higher Powers'
  end

  def hint
    ''
  end

  #@param question [Question::Multiplication]
  def question_qualifies?(question)
    question.is_a? Question::Exponential and question.exponent > 2
  end

  # @override
  def possible_questions
    Question::Exponential.all
  end

end
