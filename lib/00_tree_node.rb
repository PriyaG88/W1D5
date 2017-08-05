class PolyTreeNode
  attr_accessor :parent, :children, :value

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent
    @parent
  end

  def children
    @children
  end

  def value
    @value
  end

  def parent=(parent)
    self.parent.children.delete(self) unless @parent == nil
    @parent = parent
    @parent.children << self unless parent == nil

  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    if self.children.include?(child_node)
      child_node.parent = nil
    else
      raise "#{child_node} not a child of #{self}"
    end
  end

  def dfs(target_value)
    return self if self.value == target_value

    self.children.each do |child|
      # return child if child.value == target_value
      val = child.dfs(target_value)
      return val if val
    end
    nil
  end

  def bfs(target_value)
    queue = [self]

    until queue.empty?
      node = queue.shift
      return node if node.value == target_value
      queue.concat(node.children)
    end
  end

end
