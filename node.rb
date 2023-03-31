class Node
  def initialize(value = nil)
    @value = value
    @next_node = nil
  end

  attr_reader :value, :next_node

  def update_next(new_next)
    self.next_node = new_next
  end

  private

  attr_writer :next_node
end