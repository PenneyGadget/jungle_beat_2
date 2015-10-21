require 'minitest/autorun'
require 'minitest/pride'
require '../lib/linked_list'

class LinkedListTest < Minitest::Test

  def test_an_empty_list_returns_nil
    list = LinkedList.new

    assert_equal nil, list.all
  end

  def test_there_is_a_node
    assert Node.new(1)
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

  def test_appending_one_node_means_there_is_now_two_nodes
    list = LinkedList.new("node_1")
    list.append("node_2")

    assert_equal 2, list.count
    assert_equal "node_1 node_2", list.all
  end

  def test_list_can_append_two_nodes
    list = LinkedList.new("node_1")
    list.append("node_2")
    list.append("node_3")

    assert_equal "node_2", list.head.pointer.data
    assert_equal "node_3", list.head.pointer.pointer.data
    assert_equal 3, list.count
    assert_equal "node_1 node_2 node_3", list.all
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
    assert_equal "new_node_1 node_1", list.all
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
    assert_equal "node_3 node_2 node_1", list.all
  end

  def test_list_can_get_a_new_node_inserted_in_the_middle
    list = LinkedList.new("node_1")
    list.append("node_2")
    list.append("node_3")
    list.insert(1, "and")

    assert_equal "and", list.head.pointer.data
    assert_equal "node_2", list.head.pointer.pointer.data
    assert_equal "node_1 and node_2 node_3", list.all
  end

  def test_list_can_insert_two_nodes_to_the_list
    list = LinkedList.new("node_1")
    list.append("node_2")
    list.append("node_3")
    list.insert(1, "and")
    list.insert(3, "&")

    assert_equal "and", list.head.pointer.data
    assert_equal "&", list.head.pointer.pointer.pointer.data
    assert_equal "node_1 and node_2 & node_3", list.all
  end

  def test_list_can_insert_two_nodes_next_to_each_other
    list = LinkedList.new("Hello")
    list.append("there")
    list.append("friend")
    list.insert(2, "lovely")
    assert_equal "lovely", list.head.pointer.pointer.data

    list.insert(2, "beautiful")
    assert_equal "beautiful", list.head.pointer.pointer.data
    assert_equal "Hello there beautiful lovely friend", list.all
  end

  def test_we_can_insert_a_string_of_words_that_get_separated_into_individual_nodes
    list = LinkedList.new("Hello")
    list.append("friend")
    list.insert(1, "there lovely")
    assert_equal "Hello there lovely friend", list.all
    assert_equal 4, list.count

    list.insert(2, "doo dee dum bop bam")
    assert_equal "Hello there doo dee dum bop bam lovely friend", list.all
    assert_equal 9, list.count
  end

  def test_includes_method_returns_a_boolean_value
    list = LinkedList.new("Hello")
    list.append("there")
    list.append("friend")

    assert_equal "Hello there friend", list.all
    assert list.includes?("friend")
    refute list.includes?("puppies")
  end

  def test_count_method_returns_the_number_of_nodes_in_the_list
    list = LinkedList.new(1)
    list.append(2)
    list.append(4)
    list.append(8)

    assert_equal 4, list.count
  end

  def test_we_can_find_the_second_to_last_node
    list = LinkedList.new("boom")
    list.append("zoom")
    list.append("loom")

    assert_equal "zoom", list.second_to_last.data
  end

  def test_we_can_remove_the_last_element
    list = LinkedList.new("boom")
    list.append("zoom")
    list.append("loom")

    assert_equal "loom", list.remove_tail
    assert_equal "zoom", list.find_tail.data
    assert_equal 2, list.count
    assert_equal "boom zoom", list.all
  end

  def test_we_can_pop_the_tail_node_off
    list = LinkedList.new("Hello")
    list.append("there")
    list.append("friend")
    list.pop

    assert_equal "there", list.find_tail.data
    assert_equal 2, list.count
    assert_equal "Hello there", list.all
  end

  def test_we_can_pop_multiple_elements_off_the_list_and_return_those_items_as_a_string
    list = LinkedList.new("work")
    list.append("is")
    list.append("the")
    list.append("curse")
    list.append("of")
    list.append("the")
    list.append("drinking")
    list.append("class")

    assert_equal "curse of the drinking class", list.pop(5)
    assert_equal 3, list.count
    assert_equal "work is the", list.all
    assert_equal "the", list.find_tail.data
  end

  def test_we_can_find_varying_node_data_when_we_pass_in_an_index_number
    list = LinkedList.new("bright")
    list.append("copper")
    list.append("kettles")
    list.append("and")
    list.append("warm")
    list.append("woolen")
    list.append("mittens")

    assert_equal "warm", list.find(4)
    assert_equal "copper kettles", list.find(1, 2)
    assert_equal "kettles and warm", list.find(2, 3)
  end

  def test_list_can_return_all_node_data_from_the_list_in_order
    list = LinkedList.new("bright")
    list.append("copper")
    list.append("kettles")
    list.append("and")
    list.append("warm")
    list.append("woolen")
    list.append("mittens")

    assert_equal "bright copper kettles and warm woolen mittens", list.all
  end

  def test_we_can_delete_any_node_other_than_the_head_based_on_its_index
    list = LinkedList.new("bee")
    list.append("bop")
    list.append("a")
    list.append("lula")

    assert_equal "bop", list.delete_by_index(1)
    assert_equal "bee a lula", list.all
  end

  def test_we_can_delete_any_node_other_than_the_head_based_on_its_data
    list = LinkedList.new("bee")
    list.append("bop")
    list.append("a")
    list.append("lula")

    assert_equal "bop", list.delete_by_data("bop")
    assert_equal 3, list.count
    assert_equal "bee a lula", list.all
  end

  def test_we_can_delete_the_head_and_second_node_becomes_new_head
    skip
    #should the second node become the new head or should the list cease to exist?
  end

  def test_we_try_to_find_more_items_than_are_in_the_list
    skip
    #list is 8 items long and we say list.find(4, 10)
  end

  def test_we_try_to_pop_off_more_items_than_are_in_the_list
    skip
  end

  def test_an_error_is_raised_if_we_try_to_pop_off_the_tail_while_its_also_the_head
    skip
  end

  def test_an_error_is_raised_if_we_try_to_remove_last_element_while_its_also_the_head
    skip
  end

  def test_an_error_is_raised_if_we_try_to_find_the_second_to_last_element_in_a_one_element_list
    skip
  end

  def test_node_data_can_be_any_kind_of_data_and_we_can_do_all_the_things
    skip
    list = LinkedList.new("whoa there")
    list.append(234)
    list.prepend(["apples", "oranges"])
    list.insert(1, "are so")
    list.append({"puppies" => :cute})

    assert_equal 5, list.count
    assert_equal 234, list.second_to_last.data

    list.delete_by_index(4)
    list.pop

    assert_equal "apples oranges are so whoa there", list.all
    # assert list.includes?("oranges") #failing??
    # assert_equal "whoa there", list.find(4, 2) #undefined method 'data' for nil class
  end

end
