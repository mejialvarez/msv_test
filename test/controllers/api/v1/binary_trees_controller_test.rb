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

  test "GET#lowest_common_ancestor return 422 if the node1 parameter doesn't belong to binary tree" do
    binary_tree = binary_trees(:one)
    get lowest_common_ancestor_api_v1_binary_tree_path(binary_tree), params: { node1: 100, node2: 76 }

    assert_response :unprocessable_entity
    body = JSON.parse(response.body)
    assert_equal "The values of the nodes don't belong to the binary tree", body['error']
  end

  test "GET#lowest_common_ancestor return 422 if the node2 parameter doesn't belong to binary tree" do
    binary_tree = binary_trees(:one)
    get lowest_common_ancestor_api_v1_binary_tree_path(binary_tree), params: { node1: 39, node2: 100 }

    assert_response :unprocessable_entity
    body = JSON.parse(response.body)
    assert_equal "The values of the nodes don't belong to the binary tree", body['error']
  end

  test "GET#lowest_common_ancestor return a json with the lowest common ancestor" do
    binary_tree = binary_trees(:one)
    get lowest_common_ancestor_api_v1_binary_tree_path(binary_tree), params: { node1: 39, node2: 76 }

    assert_response :success
    body = JSON.parse(response.body)
    assert_equal 67, body['lowest_common_ancestor']
  end
end