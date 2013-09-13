class Question::Multiplication < Question::Binary

  #@override
  def self.new_expression(left, right)
    MultiplicationExpression.build left, right
  end

  #validates :plain_text,
  #          :presence => true,
  #          :uniqueness => true
  #
  #validates :html,
  #          :presence => true,
  #          :uniqueness => true
  #
  #validates :answer_plain_text,
  #          :presence => true,
  #          :uniqueness => true
  #
  #validates :answer_html,
  #          :presence => true,
  #          :uniqueness => true

end