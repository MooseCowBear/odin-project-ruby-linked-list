class Node
  def initialize(value = nil)
    @value = value
    @next_node = nil
  end

  attr_reader :value

  def update_next(new_next)
    self.next_node = new_next
  end

  private

  attr_accessor :next_node
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
    curr
  end

  def at(index)
    i = 0
    curr = self.head
    while i < index && curr
      i += 1
      curr = curr.next
    end
    curr
  end

  def pop
    new_tail = self.head
    until new_tail.next.next.nil?
      new_tail = tail.next
    end
    old_tail = new_tail.next
    new_tail.update_next(nil)
    old_tail 
  end

  def contains?(value)
    return !find(value).nil?
  end

  def find(value)
    index = 0
    found = false
    curr = self.head
    unless curr.nil? || found
      if curr.value == value
        found = true
      else
        index += 1
        curr = curr.next
      end
    end
    found ? index : nil
  end

  def to_s
    list = []
    curr = self.head
    while curr
      list << "( #{curr.head} )"
      list << "->"
    end
    list << "nil"
    list.join(" ")
  end

  def insert_at(value, index)
    index = convert_index(index)
    raise RangeError if index.nil?
    
    new_node = Node.new(value)
    if index == size
      self.append(new_node)
    elsif index == 1
      self.prepend(new_node)
    else 
      node_before = self.at(index - 1)
      new_node.update_next(node_before.next)
      node_before.next = new_node
    end
    self
  end

  def remove_at(index)
    
  end

  def convert_index(index, remove = false)
    size = self.size
    last_index = remove ? size - 1 : size
    if index < 0 && index.between?(-1, -size) #insert at 0 is ok bc pushes everyone down
      return size + index
    elsif index >= 0 && index.between?(0, last_index) #to allow for appending to end want == to size ok
      return index
    end
    nil
  end
end