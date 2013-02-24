require 'spec_helper'

describe Dota::Friend do
  let(:friend) { Dota::Friend.new(fixture(:friend)) }

  it 'returns steam id' do
    friend.steam_id.must_equal 76561198026970517
  end

  it 'returns relationshipt' do
    friend.relationship.must_equal 'friend'
  end

  it 'returns time friend since' do
    friend.friend_since.must_equal Time.at(1360152229)
  end
end
