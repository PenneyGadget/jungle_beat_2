require 'minitest/autorun'
require 'minitest/pride'
require '../lib/node'

class NodeTest < Minitest::Test

  def test_a_node_is_created
    node = Node.new("hello")

    assert node
  end

  def test_it_has_data
    node = Node.new("world")

    assert_equal "world", node.data
  end

  def test_it_has_a_pointer_pointing_to_nil
    node = Node.new("!")

    assert_equal nil, node.pointer
  end

end
