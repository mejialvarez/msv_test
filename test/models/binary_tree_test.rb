# == Schema Information
#
# Table name: binary_trees
#
#  id         :bigint(8)        not null, primary key
#  nodes      :integer          not null, is an Array
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class BinaryTreeTest < ActiveSupport::TestCase
  should validate_presence_of(:nodes)
end
