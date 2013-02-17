require 'spec_helper'

describe Dota::LiveLeague do
  let(:live_league) { Dota::LiveLeague.new(fixture(:live_league)) }

  it 'returns league id' do
    live_league.id.must_equal 21
  end

  it 'returns players' do
    live_league.players.must_be_kind_of Array
    live_league.players.first.must_be_kind_of Dota::LiveLeague::Player
  end

  it 'returns string representation of the object' do
    object_id = (live_league.object_id << 1).to_s(16)
    live_league.inspect.must_equal "#<Dota::LiveLeague:0x#{object_id}>"
  end
end
