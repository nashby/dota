require 'spec_helper'

describe Dota::History::Player do
  let(:player) { Dota::History::Player.new(fixture(:history_player)) }
  let(:player_id) { 4294967295 }

  it 'returns account id' do
    player.id.must_equal player_id
  end

  it 'returns slot' do
    player.slot.must_equal 0
  end

  it 'returns hero id' do
    player.hero_id.must_equal 87
  end

  it 'returns hero name' do
    player.hero.must_equal 'Disruptor'
  end

  it "should return valid hash" do
    player.to_hash.must_equal({ id: player_id, slot: 0, hero: 'Disruptor' })
  end
end
