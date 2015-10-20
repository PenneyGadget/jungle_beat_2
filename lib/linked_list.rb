require_relative 'node'

class LinkedList

  attr_accessor :head, :data, :pointer

  def initialize(data)
    @head = Node.new(data, pointer=nil)
  end

  def find_tail
    current_head = @head
    while current_head != nil
      current_head = pointer
    end
    current_head
  end

  def append(data)

  end

end

node_1 = Node.new(1)
node_1.pointer
node_1.data

list = LinkedList.new(1)
list.head

# node_2 = Node.new(2)
# node_3 = Node.new(3)
# node_4 = Node.new(4)
#
# node_1.next = node_2
# node_2.next = node_3
# node_3.next = node_4
