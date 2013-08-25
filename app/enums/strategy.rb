class Strategy < ClassyEnum::Base
  def name
    self.class.to_s.demodulize.titleize
  end
end

class Strategy::None < Strategy
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


