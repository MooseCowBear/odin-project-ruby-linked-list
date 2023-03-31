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

class LinkedList
  def initialize(root = nil)
    @root = root
  end

  attr_accessor :root

  def append(value)
    tail = self.tail
    new_node = Node.new(value)

    if tail == nil
      self.root = new_node

    else
      tail.update_next(new_node)
    end

    self 
  end

  def prepend(value)
    head = self.head
    new_node = Node.new(value)

    unless head.nil?
      new_node.update_next(head)
    end

    self.root = new_node
    self
  end

  def size
    count = 0
    curr = self.head

    until curr.nil?
      count += 1
      curr = curr.next_node
    end

    count
  end

  def head
    root
  end

  def tail(with_prev = false)
    curr = self.head
    prev = nil
    tail = nil

    until curr.nil?
      tail = curr
      curr = curr.next_node

      unless curr.nil?
        prev = tail 
      end
    end
    return tail unless with_prev

    return [tail, prev] #want prev for pop method
  end

  def at(index)
    i = 0
    curr = self.head

    while i < index && curr
      i += 1

      curr = curr.next_node
    end
    curr
  end

  def pop 
    tail, prev = self.tail(with_prev = true)

    return nil if tail.nil? 

    if prev.nil? #tail is the root 
      self.root = nil

    else
      prev.update_next(nil)

    end

    tail
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
        curr = curr.next_node
      end
    end

    found ? index : nil
  end

  def to_s
    list = []
    curr = self.head

    until curr.nil?
      list << "( #{curr.value} )"
      list << "->"
      curr = curr.next_node
    end

    list << "nil"
    list.join(" ")
  end

  def insert_at(value, index)
    index = convert_index(index)
    raise RangeError if index.nil?
    
    if index == size
      self.append(value)

    elsif index == 0
      self.prepend(value)

    else 
      new_node = Node.new(value)

      node_before = self.at(index - 1)

      new_node.update_next(node_before.next_node)

      node_before.update_next(new_node)
    end
    self
  end

  def remove_at(index)
    index = convert_index(index, true)
    raise RangeError if index.nil?

    removed = nil

    if index == 0
      removed = root

      self.root = root.next_node
    else
      node_before = at(index - 1) 

      removed = node_before.next_node

      node_before.update_next(node_before.next_node.next_node) 
    end

    removed
  end

  def convert_index(index, remove = false)
    size = self.size

    last_index = remove ? size - 1 : size 

    if index < 0 && index.between?(-size, -1) 
      return remove ? size + index : size + index + 1

    elsif index >= 0 && index.between?(0, last_index) 
      return index
    end

    nil
  end
end

my_list = LinkedList.new
puts my_list # => nil

my_list.append(1)
puts my_list # => ( 1 ) -> nil

my_list.prepend(2)
puts my_list # => ( 2 ) -> ( 1 ) -> nil

puts my_list.head.value # => 2

puts my_list.tail.value # => 1

puts my_list.at(1).value # => 1

puts my_list.find(2) # => 0

pp my_list.find(3) # => nil

puts my_list.contains?(2) # => true
puts my_list.contains?(3) # => false

my_list.insert_at(3, 0) 
puts my_list # => ( 3 ) -> ( 2 ) -> ( 1 ) -> nil

my_list.insert_at(5, 1)
puts my_list # => ( 3 ) -> ( 5 ) -> ( 2 ) -> ( 1 ) -> nil

removed = my_list.pop
puts removed.value # => 1
puts my_list # => ( 3 ) -> ( 5 ) -> ( 2 ) -> nil


my_list.insert_at(6, -1) 
puts my_list # => ( 3 ) -> ( 5 ) -> ( 2 ) -> ( 6 ) -> nil

my_list.insert_at(7, -2)
puts my_list # => ( 3 ) -> ( 5 ) -> ( 2 ) -> ( 7 ) -> ( 6 ) -> nil

my_list.remove_at(0)
puts my_list # => ( 5 ) -> ( 2 ) -> ( 7 ) -> ( 6 ) -> nil

my_list.remove_at(-1)
puts my_list  # => ( 5 ) -> ( 2 ) -> ( 7 ) -> nil

begin 
  my_list.insert_at(100, 10)
rescue RangeError
  puts "Received expected error"
end 

begin 
  my_list.insert_at(100, -10)
rescue RangeError
  puts "Received expected error"
end 

begin 
  my_list.remove_at(10)
rescue RangeError
  puts "Received expected error"
end

begin 
  my_list.remove_at(-10)
rescue RangeError
  puts "Received expected error"
end

begin 
  my_list.remove_at(3)
rescue RangeError
  puts"Received expected error"
end