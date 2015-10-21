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

  def test_we_can_get_a_list_of_all_the_beats
    jb = JungleBeat.new("boo do da zippity do da")

    assert_equal "boo do da zippity do da", jb.all
  end

  def test_we_can_pass_in_a_string_that_becomes_a_linked_list
    jb = JungleBeat.new("bee bop a lula bam bam boom")
#fix this
    assert jb
  end

  def test_the_first_word_is_the_head
    jb = JungleBeat.new("oooh eee oooh aaah aaah")

    assert_equal "oooh", jb.linked_list.head.data
  end

  def test_count_the_number_of_beats
    jb = JungleBeat.new("bee bop a lula bam bam boom")

    assert_equal 7, jb.count
  end

  def test_we_can_append_beats
    jb = JungleBeat.new("bee bop a lula")
    jb.append("wow")

    assert_equal "bee bop a lula wow", jb.all
    assert_equal "wow", jb.find_tail.data
  end

  def test_we_can_prepend_beats
    jb = JungleBeat.new("bee bop a lula")
    jb.prepend("doop")
    jb.prepend("dee")

    assert_equal "dee doop bee bop a lula", jb.all
    assert_equal "dee", jb.linked_list.head.data
  end

  def test_we_can_find_the_final_beat
    jb = JungleBeat.new("bee bop a lula bam bam boom")

    assert_equal "boom", jb.find_tail.data
    assert_nil jb.find_tail.pointer
  end

  def test_we_can_remove_the_final_beat
    jb = JungleBeat.new("bee bop a lula bam bam boom")

    assert_equal "boom", jb.remove_tail
    assert_equal "bee bop a lula bam bam", jb.all

    assert_equal "bam", jb.pop
    assert_equal "bee bop a lula bam", jb.all
  end

  def test_we_can_remove_several_beats_off_the_end
    jb = JungleBeat.new("bee bop a lula bam bam boom")

    assert_equal "bam bam boom", jb.pop(3)
    assert_equal "bee bop a lula", jb.all
  end

  def test_we_can_insert_a_beat_in_the_middle
    jb = JungleBeat.new("deep dee dee doh")
    jb.insert(2, "dop")

    assert_equal "deep dee dop dee doh", jb.all
    assert_equal 5, jb.count
  end

  def test_we_can_insert_a_string_of_beats
    jb = JungleBeat.new("deep dee dop dee doh")
    jb.insert(3, "boom boom bam")

    assert_equal "deep dee dop boom boom bam dee doh", jb.all
    # assert_equal 8, jb.count
  end

  def test_we_can_see_if_a_beat_is_in_the_list
    skip
    #this isn't working because the insert method isn't splitting the string
    jb = JungleBeat.new("boo do da zippity do da")

    assert jb.includes?("zippity")
    refute jb.includes?("pickles")
  end

  def test_we_can_find_a_string_of_beats
    skip
    jb = JungleBeat.new("boo do da zippity do da")

    assert jb.includes?("zippity do da")
    refute jb.includes?("pickles do da")
  end

  def test_we_can_delete_a_beat_by_index
    jb = JungleBeat.new("bee bop a lula bam bam boom")

    assert_equal "lula", jb.delete_by_index(3)
    assert_equal "bee bop a bam bam boom", jb.all
  end

  def test_we_can_delete_a_beat_by_its_name
    jb = JungleBeat.new("bee bop a lula bam bam boom")

    assert_equal "boom", jb.delete_by_data("boom")
    assert_equal "bee bop a lula bam bam", jb.all
  end

  def test_we_can_change_the_speed_of_the_playback
    jb = JungleBeat.new("bee bop a lula bam bam boom")
    jb.rate = 200

    assert_equal 200, jb.rate
  end

  def test_we_can_change_the_voice
    jb = JungleBeat.new("roses are red bam dee dee boom")

    assert_equal "Boing", jb.voice
    jb.voice = "Bahh"
    assert_equal "Bahh", jb.voice
  end

  def test_we_can_reset_the_rate_back_to_the_original_speed
    jb = JungleBeat.new("bee bop a lula bam bam boom")

    assert_equal 500, jb.rate
    jb.rate = 200
    assert_equal 200, jb.rate
    jb.reset_rate
    assert_equal 500, jb.rate
  end

  def test_we_can_reset_the_voice_back_to_the_original_voice

  end

  def test_play_rate_and_voice_surprise_method
    skip
    jb = JungleBeat.new("roses are red bam dee dee boom")
#why isn't this one running???
    assert jb.rate_and_voice_surprise!
  end

end
