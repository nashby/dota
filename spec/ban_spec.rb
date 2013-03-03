require 'spec_helper'

describe Dota::Ban do
  let(:ban) { Dota::Ban.new(fixture(:ban)) }

  it 'returns steam id' do
    ban.steam_id.must_equal 76561198070396703
  end

  it 'returns community banned status' do
    ban.community_banned?.must_equal false
  end

  it 'returns vac banned status' do
    ban.vac_banned?.must_equal false
  end

  it 'returns economy banned status' do
    ban.economy_banned_status.must_equal 'none'
  end
end
