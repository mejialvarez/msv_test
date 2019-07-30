require 'test_helper'

class BinaryTree::BinaryTreeTest < ActiveSupport::TestCase

  test '#build build the binary tree sucessfully' do
    binary_tree = BinaryTree::BinaryTree.new([67,39,76,28,44,74,85])
    binary_tree.build
    
    assert_equal 67, binary_tree.root.value
    assert_equal 39, binary_tree.root.left.value
    assert_equal 76, binary_tree.root.right.value
    assert_equal 28, binary_tree.root.left.left.value
    assert_equal 44, binary_tree.root.left.right.value
    assert_equal 74, binary_tree.root.right.left.value
    assert_equal 85, binary_tree.root.right.right.value
  end

  test '#build ignore node equals to root node' do
    binary_tree = BinaryTree::BinaryTree.new([67,67,67])
    binary_tree.build
    
    assert_equal 67, binary_tree.root.value
    assert_nil binary_tree.root.left
    assert_nil binary_tree.root.right
  end

  test '#lowest_common_ancestor return the lowest common ancestor sucessfully' do
    binary_tree = BinaryTree::BinaryTree.new([67,39,76,28,44,74,85,29,83,87])
    binary_tree.build

    assert_equal 39, binary_tree.lowest_common_ancestor(29,44).value
    assert_equal 67, binary_tree.lowest_common_ancestor(44,85).value
    assert_equal 85, binary_tree.lowest_common_ancestor(83,87).value
    assert_equal 39, binary_tree.lowest_common_ancestor(39,44).value
    assert_equal 67, binary_tree.lowest_common_ancestor(67,87).value
  end

  test '#lowest_common_ancestor return nil if the binary tree has not been built' do
    binary_tree = BinaryTree::BinaryTree.new([67,39,76,28,44,74,85])

    assert_nil binary_tree.lowest_common_ancestor(28,44)
  end

  test "#lowest_common_ancestor return nil if the values of the nodes don't belong to the binary tree" do
    binary_tree = BinaryTree::BinaryTree.new([67,39,76,28,44,74,85])
    binary_tree.build

    assert_nil binary_tree.lowest_common_ancestor(100,200)
  end
end