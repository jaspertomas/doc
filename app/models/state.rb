class State < ActiveRecord::Base
  attr_accessible :category_id, :is_default, :name, :sort_order
  validates :name, presence: true
  validates :sort_order, presence: true
  validates :category_id, presence: true
  belongs_to :category

  scope :for, lambda{|category| { :conditions => { :category_id => category.id } } }
  scope :default_for, lambda{|category| { :conditions => { :category_id => category.id, is_default: true } } }

    def to_s
      name
    end
end
