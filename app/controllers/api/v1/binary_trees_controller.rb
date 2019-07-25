class Api::V1::BinaryTreesController < ApplicationController
  def create
    binary_tree = BinaryTree.new(binary_tree_params)

    if binary_tree.save
      render json: binary_tree, status: :created
    else
      render json: { errors: binary_tree.errors }, status: :unprocessable_entity
    end
  end

  private

    def binary_tree_params
      params.require(:binary_tree).permit(nodes: [])
    end
end