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

class LinkedList
  def initialize(root = nil)
    @root = root
  end

  attr_accessor :root
  def append(value)
    tail = self.tail
    new_node = Node.new(value)
    tail.update_next(new_node)
    self 
  end

  def prepend(value)
    head = self.head
    new_node = Node.new(value)
    new_node.update_next(head)
    self.root = new_node
    self
  end

  def size
    count = 0
    curr = self.head
    until curr.next.nil?
      count += 1
      curr = curr.next
    end
    count
  end

  def head
    root
  end

  def tail
    curr = self.head
    until curr.next.nil?
      curr = curr.next
    end
  end

  def at(index)

  end

  def pop
    
  end

  def at_index(index)

  end

  def contains?(value)

  end

  def find(value)

  end

  def to_s

  end
end