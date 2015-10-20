require_relative 'node'

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

    until count == position
      count += 1
      current_head = current_head.pointer
    end
    new_node.pointer = current_head
  end

  def includes?(data)

  end

  def pop

  end

  def count

  end

  def find

  end

  def all

  end

  def find_by_index

  end

  def find_by_data

  end

  def delete_by_index

  end

  def delete_by_data

  end

end

list = LinkedList.new("1")
list.append("2")
list
