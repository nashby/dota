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
end
