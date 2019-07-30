class BinaryTree::BinaryTree
  attr_reader :root

  def initialize(node_values)
    @node_values = node_values
  end

  def build
    @root = BinaryTree::Node.new(@node_values.first)
    @node_values[1..].each{ |node_value| add_node(@root, node_value) }
    return self
  end

  def lowest_common_ancestor(node_value1, node_value2)
    node_value1 = node_value1.to_i
    node_value2 = node_value2.to_i

    return nil if @root.nil? || !exists?(node_value1) || !exists?(node_value2)
    get_lca(@root, node_value1, node_value2)
  end

  private
    def add_node(ancestor, value)
      if(value > ancestor.value)
        if(ancestor.right)
          add_node(ancestor.right, value)
        else
          ancestor.right = BinaryTree::Node.new(value)
        end
      elsif(value < ancestor.value)
        if(ancestor.left)
          add_node(ancestor.left, value)
        else
          ancestor.left = BinaryTree::Node.new(value)
        end
      end
    end

    def get_lca(ancestor, node_value1, node_value2)
      return nil if ancestor.nil?

      if node_value1 < ancestor.value && node_value2 < ancestor.value
        return get_lca(ancestor.left, node_value1, node_value2)
      elsif node_value1 > ancestor.value && node_value2 > ancestor.value
        return get_lca(ancestor.right, node_value1, node_value2)
      end

      return ancestor
    end

    def exists?(node_value)
      @node_values.include?(node_value)
    end
end