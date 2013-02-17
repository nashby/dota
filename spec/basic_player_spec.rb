require 'spec_helper'

describe Dota::BasicPlayer do
  let(:player) { Dota::BasicPlayer.new(fixture(:basic_player)) }

  it 'returns account id' do
    player.id.must_equal 75021757
  end

  it 'returns slot' do
    player.slot.must_equal 0
  end

  it 'returns hero id' do
    player.hero_id.must_equal 45
  end

  it 'returns hero name' do
    player.hero.must_equal 'Pugna'
  end

  it 'returns string representation of the object' do
    object_id = (player.object_id << 1).to_s(16)
    player.inspect.must_equal "#<Dota::BasicPlayer:0x#{object_id}>"
  end
end
