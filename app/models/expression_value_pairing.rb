class ExpressionValuePairing < ActiveRecord::Base
  belongs_to :expression
  belongs_to :value, polymorphic: true
end
