class Node

  attr_accessor :data, :pointer

  def initialize(data, pointer=nil)
    @data = data
    @pointer = pointer
  end

end
