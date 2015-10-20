require 'minitest/autorun'
require 'minitest/pride'
require '../lib/linked_list'

class LinkedListTest < Minitest::Test

  def test_there_is_a_node
    node = Node.new(1)

    assert node
  end

  def test_that_one_node_is_the_head
    list = LinkedList.new("head")

    assert list.head
  end

  def test_that_node_has_both_data_and_a_pointer
    node = Node.new("wheee!")

    assert node.methods.include? :data
    assert node.methods.include? :pointer

    assert "wheee!", node.data
    assert_nil node.pointer
  end

  def test_that_one_node_is_also_the_tail
    node = Node.new("node!")
    list = LinkedList.new("list!")

    assert_nil node.pointer
    assert_nil list.pointer
  end

  def test_list_can_append_one_node
    list = LinkedList.new("node_1")

    assert_equal "node_1", list.head.data
    assert_nil list.pointer

    list.append("node_2")
    assert_equal "node_2", list.head.pointer.data
  end

  def test_that_new_node_points_to_nil_and_is_therefore_the_tail
    list = LinkedList.new("node_1")
    list.append("node_2")

    assert_nil list.head.pointer.pointer
  end

  def test_original_node_is_the_head
    list = LinkedList.new("node_1")
    list.append("node_2")

    assert_equal "node_1", list.head.data
  end

  def test_head_node_points_to_data_in_second_node
    list = LinkedList.new("node_1")
    list.append("node_2")

    assert_equal "node_2", list.head.pointer.data
  end

  def test_list_can_append_two_nodes
    list = LinkedList.new("node_1")
    list.append("node_2")
    list.append("node_3")

    assert_equal "node_2", list.head.pointer.data
    assert_equal "node_3", list.head.pointer.pointer.data
  end

  def test_the_second_of_those_new_nodes_points_to_nil_and_is_the_tail
    list = LinkedList.new("node_1")
    list.append("node_2")
    list.append("node_3")

    assert_nil list.head.pointer.pointer.pointer
  end

  def test_we_can_find_the_tail_of_our_list
    list = LinkedList.new("node_1")
    list.append("node_2")
    list.append("node_3")

    assert_equal "node_3", list.find_tail.data
    assert_nil list.find_tail.pointer
  end

  def test_list_can_prepend_one_node
    list = LinkedList.new("node_1")
    list.prepend("new_node_1")

    assert_equal "new_node_1", list.head.data
    assert_equal "node_1", list.head.pointer.data
  end

  def test_old_head_node_is_now_the_tail
    list = LinkedList.new("node_1")
    list.prepend("new_node_1")

    assert_equal "node_1", list.find_tail.data
  end

  def test_list_can_prepend_two_nodes_and_everyone_is_where_they_should_be
    list = LinkedList.new("node_1")
    list.prepend("node_2")
    list.prepend("node_3")

    assert_equal "node_3", list.head.data
    assert_equal "node_2", list.head.pointer.data
    assert_equal "node_1", list.find_tail.data
  end

  def test_list_can_get_a_new_node_inserted_in_the_middle
    skip
    list = LinkedList.new("node_1")
    list.append("node_2")
    list.append("node_3")
    list.insert("and", 1)

    assert_equal "and", list.head.pointer.data
    assert_equal "node_2", list.head.pointer.pointer.data
    # assert_equal "node_1 and node_2 node_3", list.all
  end

  def test_list_can_add_two_nodes_in_the_middle
    skip
  end

  def test_includes_method_returns_a_boolean_value
    skip
  end

  def test_list_can_pop_the_tail_node_off
    skip
  end

  def test_list_has_a_new_tail
    skip
  end

  def test_count_method_returns_the_number_of_nodes_in_the_list
    skip
  end

  def test_we_can_find_random_node_data_when_we_pass_in_an_index_number
    skip
  end

  def test_we_can_find_several_pieces_of_data_starting_at_an_index_number
    skip
  end

  def test_list_can_return_all_node_data_from_the_list_in_order
    skip
  end

  def test_we_can_delete_a_node_based_on_its_index
    skip
  end

  def test_we_can_delete_a_node_based_on_its_data
    skip
  end

  def test_we_can_delete_the_head_and_second_node_becomes_new_head
    skip
  end

  def test_delete_more_items_then_are_in_the_list
    skip
  end

  def test_node_data_can_be_any_kind_of_data

  end


end
