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
    node = Node.new("ooohh")
    list = LinkedList.new("hmmmm")

    assert_nil node.pointer
    assert_nil list.pointer
  end

  def test_list_can_append_one_node
    skip
    list = LinkedList.new("node_1")

    assert_equal "node_1", list.data
    assert_nil list.pointer

    list.append("node_2")
    assert_equal
  end

  def test_that_new_node_points_to_nil_and_is_the_tail
    skip
  end

  def test_original_node_is_the_head
    skip
  end

  def test_there_are_now_two_nodes
    skip
  end

  def test_list_can_append_two_nodes
    skip
  end

  def test_the_second_of_those_new_nodes_points_to_nil_and_is_the_tail
    skip
  end

  def test_there_are_now_three_nodes

  end

  def test_list_can_append_more_than_two_nodes
    skip
  end

  def test_we_can_pass_in_a_string_and_each_word_becomes_a_node_on_the_list
    skip
  end

  def test_we_can_find_the_tail_of_our_list
    skip
  end

  def test_list_can_prepend_one_node
    skip
  end

  def test_that_new_node_is_now_the_head
    skip
  end

  def test_list_can_prepend_two_nodes
    skip
  end

  def test_the_first_of_those_nodes_is_now_the_head
    skip
  end

  def test_prepend_more_than_two_nodes
    skip
  end

  def test_list_can_get_a_new_node_inserted_in_the_middle
    skip
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
