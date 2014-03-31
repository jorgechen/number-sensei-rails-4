#TODO check that this works!!!

# Unlike most questions, its problem and solution are complex expressions
class Question::Expression < Question
  self.abstract_class = true


  # CALLBACKS
  before_validation :confirm_answer, :confirm_associations

  protected
  def confirm_associations
    self.plain_text = expression.plain_text
    self.html = expression.html

    self.answer_plain_text = answer.plain_text
    self.answer_html = answer.html

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

  # @abstract
  def confirm_answer
    if answer.blank? and expression
      self.answer = expression.evaluate
    end
  end

end