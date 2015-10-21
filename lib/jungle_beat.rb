require 'minitest/autorun'
require 'minitest/pride'
require_relative 'linked_list'
require_relative 'node'

class JungleBeat

  attr_accessor :beats, :linked_list

  def initialize(beats)
    @beats = beats
    split_beats = beats.split
    first_beat = split_beats[0]
    @linked_list = LinkedList.new(first_beat)
    split_beats.each do |beat|
      linked_list.append(beat)
    end
  end

  def play
    `say -r 200 -v Boing #{beats}`
  end

end
