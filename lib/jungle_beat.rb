require 'minitest/autorun'
require 'minitest/pride'
require_relative 'linked_list'
require_relative 'node'
require 'pry'

class JungleBeat

  attr_accessor :beats, :head, :data, :linked_list

  def initialize(beats)
    @beats = beats
    split_beats = beats.split
    first_beat = split_beats[0]
    @linked_list = LinkedList.new(first_beat)
    split_beats[1..-1].each do |beat|
      linked_list.append(beat)
    end
  end

  def play
    `say -r 200 -v Boing #{beats}`
  end

  def rate

  end

  def reset_rate

  end

  def voice

  end

  def reset_voice

  end

  def all
    linked_list.all
  end

  def count
    linked_list.count
  end

  def append(beat)
    linked_list.append(beat)
  end

  def find_tail
    linked_list.find_tail
  end

  def prepend(beat)
    linked_list.prepend(beat)
  end

  def remove_tail
    linked_list.remove_tail
  end

  def pop(num = 1)
    linked_list.pop(num)
  end

  def insert(position, data)
    linked_list.insert(position, data)
  end

  def includes?(data)
    linked_list.includes?(data)
  end

  def delete_by_index(num)
    linked_list.delete_by_index(num)
  end

  def delete_by_data(data)
    linked_list.delete_by_data(data)
  end

end
