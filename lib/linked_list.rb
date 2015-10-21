require_relative 'node'
require 'pry'

class LinkedList

  attr_accessor :head, :data, :pointer

  def initialize(data)
    @head = Node.new(data)
  end

  def find_tail
    current_head = @head
    while current_head.pointer != nil
      current_head = current_head.pointer
    end
    current_head
  end

  def append(data)
    current_head = @head
    while current_head.pointer != nil
      current_head = current_head.pointer
    end
    current_head.pointer = Node.new(data)
  end

  def prepend(data)
    new_node = Node.new(data)
    old_head = @head
    new_node.pointer = old_head
    @head = new_node
  end

  def insert(position, data)
    count = 0
    current_head = @head
    new_node = Node.new(data)

    until count == position -1
      count +=1
      current_head = current_head.pointer
    end
    new_node.pointer = current_head.pointer
    current_head.pointer = new_node
  end

  def includes?(data)
    current_head = @head
    while current_head.pointer != nil
      current_head = current_head.pointer
    end
    if current_head.data == data
      true
    else
      false
    end
  end

  def count
    count = 1
    current_head = @head
    until current_head.pointer == nil
      current_head = current_head.pointer
      count += 1
    end
    count
  end

  def second_to_last
    current_head = @head
    until current_head.pointer == find_tail
      current_head = current_head.pointer
    end
    current_head
  end

  def remove_tail
    current_head = @head
    until current_head.pointer.pointer == nil
      current_head = current_head.pointer
    end
    last_element = current_head.pointer.data
    current_head.pointer = nil
    last_element
  end

  def pop(num = 1)
    popped = []
    num.times do
      popped << find_tail.data
      new_tail = second_to_last
      new_tail.pointer = nil
    end
    popped.reverse.join(" ")
  end

  def find(pos, num = 1)
    found = []
    count = 0
    current_head = @head
    until count == pos
      current_head = current_head.pointer
      count += 1
    end
    num.times do
      found << current_head.data
      current_head = current_head.pointer
    end
    found.join(" ")
  end

  def all
    current_head = @head
    list = []
    list << current_head.data
    until current_head.pointer == nil
      current_head = current_head.pointer
      list << current_head.data
    end
    list.join(" ")
  end

  def delete_by_index(num)
    removed = []
    count = 0
    current_head = @head
    until count == num - 1
      current_head = current_head.pointer
      count += 1
    end
    removed << current_head.pointer.data
    current_head.pointer = current_head.pointer.pointer
    removed.join(" ")
  end

  def delete_by_data(data)
    removed = []
    current_head = @head
    until current_head.pointer.data == data
      current_head = current_head.pointer
    end
    removed << current_head.pointer.data
    current_head.pointer = current_head.pointer.pointer
    removed.join(" ")
  end

end
