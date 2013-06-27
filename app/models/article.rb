class Article < ActiveRecord::Base
  attr_accessible :content, :doc_entry_id, :name
  belongs_to :doc_entry
end
