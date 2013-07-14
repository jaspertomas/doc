class State < ActiveRecord::Base
  attr_accessible :fortype, :is_default, :name, :sort_order
end
