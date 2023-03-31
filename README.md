# Odin Project Ruby Linked List

A ruby implementation of a linked list.

## Methods Implemented

- #append
- #prepend
- #size
- #head
- #tail
- #at(index)

  Returns node at given index or nil if index exceeds size of list

- #pop

  Returns node popped or nil if nothing to pop

- #contains?(value)
- #find(value)
- #to_s
- #insert_at(value, index)
- #remove_at(index)

  Both #insert_at and #remove_at accept negative indices. 
  Raises RangeError if index exceeds list size. 