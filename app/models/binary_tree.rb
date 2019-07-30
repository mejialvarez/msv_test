# == Schema Information
#
# Table name: binary_trees
#
#  id         :bigint(8)        not null, primary key
#  nodes      :integer          not null, is an Array
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class BinaryTree < ApplicationRecord
  validates :nodes, presence: true

  def lowest_common_ancestor(node_value1, node_value2)
    tree = ::BinaryTree::BinaryTree.new(self.nodes).build
    tree.lowest_common_ancestor(node_value1.to_i, node_value2.to_i)
  end

  def exist?(node_value)
    self.nodes.include?(node_value.to_i)
  end
end
