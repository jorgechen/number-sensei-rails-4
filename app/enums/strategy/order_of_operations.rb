class Strategy::OrderOfOperations < Strategy
  def name
    'Order of Operations'
  end

  def hint
    ''
  end


  # @override
  def question_qualifies?(question)
    false
    #TODO
  end

  # @override
  def possible_questions
    #TODO
    []
  end

end
