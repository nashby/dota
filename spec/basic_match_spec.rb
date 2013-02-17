require 'spec_helper'

describe Dota::BasicMatch do
  let(:match) { Dota::BasicMatch.new(fixture(:basic_match)) }

  it 'returns match id' do
    match.id.must_equal 121808641
  end

  it 'returns sequence number' do
    match.seq_num.must_equal 111948919
  end

  it 'returns start time' do
    match.start.must_equal Time.at(1360503461)
  end

  it 'returns lobby type' do
    match.lobby.must_equal 'Public matchmaking'
  end

  it 'returns string representation of the object' do
    object_id = (match.object_id << 1).to_s(16)
    match.inspect.must_equal "#<Dota::BasicMatch:0x#{object_id}>"
  end
end
