require 'minitest/autorun'
require 'minitest/pride'
require '../lib/jungle_beat'

class JungleBeatTest < Minitest::Test

  def test_jungle_beats_exists
    assert JungleBeat
  end

  def test_it_initializes_with_new_beats
    assert JungleBeat.new("bee bop a lula")
  end

  def test_it_plays
    skip
    jb = JungleBeat.new("bee bop a lula bam bam boom")

    assert jb.play
  end

  def test_we_can_pass_in_a_string_that_becomes_a_linked_list
    jb = JungleBeat.new("bee bop a lula bam bam boom")

    assert jb.linked_list
  end

  def test_the_first_word_is_the_head
    jb = JungleBeat.new("oooh eee oooh aaah aaah")

    assert_equal "oooh", jb.linked_list.head.data
  end

  def test_count_the_number_of_beats
    jb = JungleBeat.new("bee bop a lula bam bam boom")

    assert_equal 7, jb.linked_list.count
  end

  def test_we_can_append_beats
    jb = JungleBeat.new("bee bop a lula")
    jb.linked_list.append("wow")

    assert_equal "bee bop a lula wow", jb.linked_list.all
    assert_equal "wow", jb.linked_list.find_tail.data
  end

  def test_we_can_prepend_beats
    jb = JungleBeat.new("bee bop a lula")
    jb.linked_list.prepend("doop")
    jb.linked_list.prepend("dee")

    assert_equal "dee doop bee bop a lula", jb.linked_list.all
    assert_equal "dee", jb.linked_list.head.data
  end

  def test_we_can_find_the_final_beat
    jb = JungleBeat.new("bee bop a lula bam bam boom")

    assert_equal "boom", jb.linked_list.find_tail.data
    assert_nil jb.linked_list.find_tail.pointer
  end

  def test_we_can_remove_the_final_beat
    jb = JungleBeat.new("bee bop a lula bam bam boom")

    assert_equal "boom", jb.linked_list.remove_tail
    assert_equal "bee bop a lula bam bam", jb.linked_list.all

    assert_equal "bam", jb.linked_list.pop
    assert_equal "bee bop a lula bam", jb.linked_list.all
  end

  def test_we_can_remove_several_beats_off_the_end
    jb = JungleBeat.new("bee bop a lula bam bam boom")

    assert_equal "bam bam boom", jb.linked_list.pop(3)
    assert_equal "bee bop a lula", jb.linked_list.all
  end

  def test_we_can_insert_a_beat_in_the_middle

  end

  def test_we_can_insert_a_string_of_beats

  end

  def test_we_can_see_if_a_beat_is_in_the_list

  end

  def test_we_can_find_a_string_of_beats

  end

  def test_we_can_get_a_list_of_all_the_beats

  end

  def test_we_can_delete_a_beat_by_index

  end

  def test_we_can_delete_a_beat_by_its_name

  end

  def test_we_can_change_the_speed_of_the_playback

  end

  def test_we_can_change_the_voice

  end

  def test_we_can_reset_the_rate_back_to_the_original_speed

  end

  def test_we_can_reset_the_voice_back_to_the_original_voice

  end

end
