class MultiplicationExpression < Expression

  def plain_text
    [children.first, token, children.last].join(' ')
  end

  def html
    plain_text
  end

  protected
  def renew_token
    self.token = 'x'
  end

end
