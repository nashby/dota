require 'spec_helper'

describe Dota::Match::Player do
  let(:player) { Dota::Match::Player.new(fixture(:match_player)) }
  let(:player_hash) { { id:    75021757, slot: 0, hero:  "Pugna",
                         kda: [1, 12, 6], gold: 345,
                         xpm:   304, gpm: 261, last_hits: 98, denies: 2, level: 13,
                         items: %w(phase_boots mekansm ring_of_basilius magic_wand bracer bracer) } }

  it 'returns kills' do
    player.kills.must_equal 1
  end

  it 'returns deaths' do
    player.deaths.must_equal 12
  end

  it 'returns assists' do
    player.assists.must_equal 6
  end

  it 'returns kda' do
    player.kda.must_equal [1, 12, 6]
  end

  it 'returns leaver status' do
    def player.raw_player;
      { 'leaver_status' => nil };
    end

    player.leaver_status.must_equal :bot

    def player.raw_player;
      { 'leaver_status' => 0 };
    end

    player.leaver_status.must_equal :played

    def player.raw_player;
      { 'leaver_status' => 1 };
    end

    player.leaver_status.must_equal :left_safe

    def player.raw_player;
      { 'leaver_status' => 2 };
    end

    player.leaver_status.must_equal :abandoned
  end

  it 'returns gold' do
    player.gold.must_equal 345
  end

  it 'returns last hits' do
    player.last_hits.must_equal 98
  end

  it 'returns the number of times a player denied a creep' do
    player.denies.must_equal 2
  end

  it 'returns the total amount of gold the player spent over the entire match' do
    player.gold_spent.must_equal 7185
  end

  it 'returns the amount of damage the player dealt to heroes' do
    player.hero_damage.must_equal 8270
  end

  it 'returns the amount of damage the player dealt to towers' do
    player.tower_damage.must_equal 597
  end

  it 'returns the amount of damage on other players that the player healed' do
    player.hero_healing.must_equal 39
  end

  it 'returns the final level' do
    player.level.must_equal 13
  end

  it 'returns items' do
    player.items.must_equal player_hash[:items]
  end

  it 'returns gpm' do
    player.gpm.must_equal 261
  end

  it 'returns xpm' do
    player.xpm.must_equal 304
  end

  it "should return valid hash" do
    player.to_hash.must_equal player_hash
  end
end
