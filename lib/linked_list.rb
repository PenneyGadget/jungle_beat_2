require_relative 'node'

class LinkedList

  attr_accessor :head, :data, :pointer

  def initialize(data)
    @head = Node.new(data)
  end

  def empty?
    @head == nil
  end

end
