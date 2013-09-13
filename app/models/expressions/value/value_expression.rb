class ValueExpression < Expression
  self.abstract_class = true

  has_one :expression_value_pairing,
          :dependent => :destroy,
          :foreign_key => 'expression_id'

  # @override
  def evaluate
    self
  end
end