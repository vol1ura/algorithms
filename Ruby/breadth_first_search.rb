# frozen_string_literal: true

# Class for tree node instances
class TreeNode
  attr_reader :value
  attr_accessor :left, :right

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end
end

def height(tree)
  tree ? [height(tree.left), height(tree.right)].max.next : 0
end

def breadth_first(root)
  (0...height(root)).map { |level| print_level(root, level) }
end

def print_level(root, level)
  return unless root
  return [root.value] if level.zero?

  [*print_level(root.left, level - 1), *print_level(root.right, level - 1)]
end

# Test
tree = TreeNode.new(1)
tree.left = TreeNode.new(2)
tree.right = TreeNode.new(3)
tree.left.left = TreeNode.new(4)
tree.left.right = TreeNode.new(5)
tree.left.left.right = TreeNode.new(6)

puts breadth_first(tree).inspect
# [[1], [2, 3], [4, 5], [6]]
