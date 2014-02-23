class Strategy::RadixConversion < Strategy
  def name
    'Converting to a Base'
  end

  def hint
    ''
  end

  # @override
  def question_qualifies?(q)
    if q.is_a? Question::RadixConversion
      true
    end
  end

  # @override
  def possible_questions
    Question::RadixConversion.all
  end

end
