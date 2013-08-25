class IntegerExpression < Expression
  has_one :value,
          :through => :expression_value_pairing,
          :source => :value,
          :source_type => 'IntegerNumber'

  validates :value,
            :presence => true

end
