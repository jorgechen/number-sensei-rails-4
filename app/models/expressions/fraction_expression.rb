class FractionExpression < ValueExpression
  has_one :fraction,
          :through => :expression_value_pairing,
          :source => :value,
          :source_type => 'Fraction'

  validates :fraction,
            :presence => true

  #@override
  def plain_text
    fraction.plain_text
  end

  #@override
  def html
    fraction.html
  end


  ###################################
  ## Useful
  ###################################
  def numerator
    fraction.numerator
  end

  def denominator
    fraction.denominator
  end

  def rational
    fraction.rational
  end

  ###################################
  ## Interface methods
  ###################################

  def to_f
    rational.to_f
  end

  def to_i
    rational.to_i
  end


  #TODO
  def *(other)
  end

  def /(other)
  end

  def +(other)
  end

  def -(other)
  end

  def **(other)
  end



end