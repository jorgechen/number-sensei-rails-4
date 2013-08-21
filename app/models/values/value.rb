class Value < ActiveRecord::Base
  self.abstract_class = true

  has_many :expressions,
           :through => :expression_value_pairings

  has_many :expression_value_pairings,
           :as => :value

end