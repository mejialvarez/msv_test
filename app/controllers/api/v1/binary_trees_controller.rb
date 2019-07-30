class Api::V1::BinaryTreesController < ApplicationController
  def create
    binary_tree = BinaryTree.new(binary_tree_params)

    if binary_tree.save
      render json: binary_tree, status: :created
    else
      render json: { status: 422, error: binary_tree.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def lowest_common_ancestor
    @tree_record = BinaryTree.find(params[:id])

    if !@tree_record.exist?(params[:node1]) || !@tree_record.exist?(params[:node2])
      render json: { status: 422, error: "The values of the nodes don't belong to the binary tree" }, status: :unprocessable_entity
    else
      lca = @tree_record.lowest_common_ancestor(params[:node1], params[:node2]).try(:value)
      render json: { lowest_common_ancestor: lca }, status: :ok
    end
  end

  private
    def binary_tree_params
      params.require(:binary_tree).permit(nodes: [])
    end
end