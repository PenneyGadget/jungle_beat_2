require_relative 'node'

class LinkedList

  attr_accessor :head, :data, :pointer

  def initialize(data)
    @head = Node.new(data)
  end

  def find_tail
    current_head = @head
    while current.pointer != nil
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

end

node_1 = Node.new(1)
node_1.pointer
node_1.data

list = LinkedList.new(1)
list.head
list.append(2)
list
