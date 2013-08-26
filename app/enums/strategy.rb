class Strategy < ClassyEnum::Base
  def name
    self.class.to_s.demodulize.titleize
  end

  def make_expression
    e = Expression.new token: 'x'
    e.add_child Expression.new(token: '3')
    e.add_child Expression.new(token: '4')
    e
  end
end

# Default
class Strategy::None < Strategy
end

############################################################

class Strategy::GCD < Strategy
  def name
    'Greatest Common Denominator'
  end
end

class Strategy::MultiplyBy5 < Strategy
  def name
    'Multiply by 5'
  end
end

class Strategy::MultiplyBy25 < Strategy
  def name
    'Multiply by 25'
  end
end

