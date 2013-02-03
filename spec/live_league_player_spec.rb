require 'spec_helper'

describe Dota::LiveLeague::Player do
  let(:player) { Dota::LiveLeague::Player.new(fixture(:live_league_player)) }

  it 'returns account id' do
    player.id.must_equal 44463405
  end

  it 'returns nickname' do
    player.name.must_equal "EG.Bdiz [RC]"
  end

  it 'returns hero id' do
    player.hero_id.must_equal 90
  end

  it 'returns hero name' do
    player.hero.must_equal "Keeper of the Light"
  end

  it 'returns team' do
    player.team.must_equal :radiant
  end
end
