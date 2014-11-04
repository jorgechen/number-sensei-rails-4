# http://math-magic.com/multiply_stategies/mult_last_add_10.htm
class Strategy::PrimeNumber < Strategy
  def name
    'Primes'
  end

  def hint
    ''
  end

  #@param question [Question::Multiplication]
  def question_qualifies?(question)
    false
  end

  # @override
  def possible_questions
    []
  end

end
