class Strategy < ClassyEnum::Base
  def name
    'Strategy'
  end
end

class Strategy::None < Strategy
  def name
    'No strategy'
  end
end

class Strategy::MultiplyBy25 < Strategy
  def name
    'Multiply by 25'
  end
end
