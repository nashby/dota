require 'spec_helper'

describe Dota::Player do
  let(:player) { Dota::Player.new(fixture(:player)) }

  it 'returns account id' do
    player.id.must_equal 75021757
  end

  it 'returns items' do
    player.items.must_equal ['phase_boots', 'mekansm', 'ring_of_basilius', 'magic_wand', 'bracer', 'bracer']
  end

  it 'returns gpm' do
    player.gpm.must_equal 261
  end

  it 'returns xpm' do
    player.xpm.must_equal 304
  end
end
