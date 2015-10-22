require 'minitest/autorun'
require 'minitest/pride'
require_relative 'linked_list'
require_relative 'node'
require 'pry'

class JungleBeat

  attr_accessor :beats, :head, :data, :linked_list, :rate, :voice

  def initialize(beats)
    @beats = beats
    @rate = 500
    @voice = "Boing"
    split_beats = beats.split
    first_beat = split_beats[0]
    @linked_list = LinkedList.new(first_beat)
    split_beats[1..-1].each do |beat|
      linked_list.append(beat)
    end
    @voices = %w(Agnes Kathy Princess Samantha Vicki Victoria Alex Bruce
                 Fred Junior Ralph Albert Bad Bahh Bells Boing Bubbles
                 Cello Deranged Good Hysterical Pipe Trinoids Whisper Zarvox)
  end

  def play
    `say -r #{rate} -v Boing #{beats}`
  end

  def reset_rate
    @rate = 500
  end

  def reset_voice
    @voice = "Boing"
  end

  def play_rate_and_voice_surprise!
    `say -r #{rand(0..500)} -v #{@voices.sample} #{beats}`
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

  def find(position, num = 1)
    linked_list.find(position, num)
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
