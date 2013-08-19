class Expression < ActiveRecord::Base
  acts_as_tree order: 'sort_order',
               with_advisory_lock: false
end
