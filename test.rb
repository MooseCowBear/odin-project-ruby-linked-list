require_relative './linked_list.rb'

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

puts my_list.at(-3).value # => 5

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