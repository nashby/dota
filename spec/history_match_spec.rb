require 'spec_helper'

describe Dota::History::Match do
  let(:match) { Dota::History::Match.new(fixture(:history_match)) }

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

  it 'returns players' do
    match.players.must_be_kind_of Array
    match.players.first.must_be_kind_of Dota::History::Player
  end

  it 'returns string representation of the object' do
    object_id = (match.object_id << 1).to_s(16)
    match.inspect.must_equal "#<Dota::History::Match:0x#{object_id}>"
  end

  describe '#to_hash' do
    let(:expected) { { id:              121808641,
                       sequence_number: 111948919,
                       start_time:      Time.at(1360503461),
                       lobby:           "Public matchmaking",
                       players:         [{ id: 4294967295, slot: 0,     hero: "Disruptor" },
                                         { id: 4294967295, slot: 1,     hero: "Night Stalker" },
                                         { id: 4294967295, slot: 2,     hero: "Lina" },
                                         { id: 4294967295, slot: 3,     hero: "Storm Spirit" },
                                         { id: 85082201,   slot: 128,   hero: "Faceless Void" },
                                         { id: 4294967295, slot: 129,   hero: "Venomancer" },
                                         { id: 40171032,   slot: 130,   hero: "Shadow Fiend" },
                                         { id: 4294967295, slot: 131,   hero: "Silencer" },
                                         { id: 4294967295, slot: 132,   hero: "Witch Doctor" }]
    } }

    it "should return expected hash" do
      match.to_hash.must_equal expected
    end
  end
end
