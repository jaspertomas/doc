# == Schema Information
#
# Table name: articles
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  content      :text
#  doc_entry_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Article < ActiveRecord::Base
  attr_accessible :content, :doc_entry_id, :name
  belongs_to :doc_entry
end
