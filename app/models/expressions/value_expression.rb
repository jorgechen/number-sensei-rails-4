class ValueExpression < Expression
  self.abstract_class = true
  include ValueInterface

  # @override
  def evaluate
    self
  end
end