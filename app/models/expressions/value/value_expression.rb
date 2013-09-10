class ValueExpression < Expression
  self.abstract_class = true

  # @override
  def evaluate
    self
  end
end