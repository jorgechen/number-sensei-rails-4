class DecimalExpression < Expression
  has_one :value,
          :through => :expression_value_pairing,
          :source => :value,
          :source_type => 'DecimalNumber'

  validates :value,
            :presence => true

  protected
    def renew_token
      self.token = value.value
    end
end
