class Post < ActiveRecord::Base
  attr_accessible :category_id, :content, :name, :topic_id
  belongs_to :category
  belongs_to :topic
  validate :name, presence: true
end
