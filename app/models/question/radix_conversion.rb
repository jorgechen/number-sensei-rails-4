class Question::RadixConversion < Question
  # @override
  def appendix
    "<sub>#{answer.radix}</sub>"
  end

  def self.build(decimal, base_from, base_to)
    x = self.new
    x.expression = RadixExpression.build(decimal, base_from)
    x.answer = RadixExpression.build(decimal, base_to)
    x
  end

  protected

  def confirm_associations
    self.plain_text = expression.plain_text
    self.html = expression.html
    self.answer_plain_text = answer.value_string
    self.answer_html = answer.value_string

    # save new associations
    if expression.new_record?
      expression.save!
      self.expression = expression
    end

    if answer.new_record?
      answer.save!
      self.answer = answer
    end
  end

  def confirm_answer
  end

end