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

require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
