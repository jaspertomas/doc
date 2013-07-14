# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ActiveRecord::Base
  attr_accessible :name, :is_default, :sort_order, :fortype
  has_many :posts
  
  scope :fortopics, :conditions => { :fortype => ["Topic","Any"]}
  scope :forposts, :conditions => { :fortype => ["Post","Any"]}

  def to_s
    self.name
  end

end
