class State < ActiveRecord::Base
  attr_accessible :category_id, :is_default, :name, :sort_order
  validates :name, presence: true
  validates :sort_order, presence: true
  validates :category_id, presence: true
  belongs_to :category


end
