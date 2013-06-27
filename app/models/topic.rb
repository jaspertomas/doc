class Topic < ActiveRecord::Base
  attr_accessible :name, :parent_id
  validate :name, :presence=> true
  has_many :posts
  belongs_to :parent, :class_name => "Topic", :foreign_key => 'parent_id'
  has_many :children, :class_name => "Topic", :foreign_key => 'parent_id'

  def is_root?
    self.parent_id==nil || self.parent_id==0
  end  
  
  def to_s
    self.name
  end
  
end
