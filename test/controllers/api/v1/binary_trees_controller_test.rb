class BinaryTreesControllerTest < ActionDispatch::IntegrationTest
  test 'POST#create create a new binary tree' do
    assert_difference 'BinaryTree.count' do
      post api_v1_binary_trees_url, as: :json, params: { binary_tree: { nodes: [2,3,1] } }
    end
    assert_response :created
  end

  test "POST#create doesn't create a binary tree if the nodes parameter is empty" do
    assert_no_difference 'BinaryTree.count' do
      post api_v1_binary_trees_url, as: :json, params: { binary_tree: { nodes: [] } }
    end
    assert_response :unprocessable_entity
  end
end