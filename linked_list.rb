class Node
  def initialize(value = nil)
    @value = value
    @next_node = nil
  end

  def update_next(new_next)
    self.next_node = new_next
  end

  private
  attr_accessor :value, :next_node
end

