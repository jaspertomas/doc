# == Schema Information
#
# Table name: posts
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  content     :string(255)
#  category_id :integer
#  topic_id    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Post < ActiveRecord::Base
  acts_as_commentable 
  
  attr_accessible :category_id, :content, :name, :topic_id, :sort_order, :state_id
  belongs_to :category
  belongs_to :topic
  belongs_to :state
  validates :name, presence: true
  validates :sort_order, presence: true
end
