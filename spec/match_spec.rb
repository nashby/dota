require 'spec_helper'

describe Dota::Match do
  before do
    stub_request(:get,  'https://api.steampowered.com/IDOTA2Match_570/GetMatchDetails/V001/?key=TEST_API_KEY&match_id=27110133').
      to_return(status: 200, body: fixture(:match))
  end

  let(:match) { client.match(27110133) }

  it 'returns match id' do
    match.id.must_equal 27110133
  end

  it 'returns match sequence number' do
    match.seq_num.must_equal 27106670
  end

  it 'returns start time' do
    match.start.must_equal Time.at(1342739723)
  end

  it 'returns the winner' do
    match.winner.must_equal :dire
  end

  it 'returns first blood time' do
    match.first_blood.must_equal 133
  end

  it 'returns players' do
    match.players.must_be_kind_of Array
    match.players.first.must_be_kind_of Dota::Player
  end

  it 'returns season' do
      match.season.must_equal 7
  end

  it 'returns duration' do
      match.duration.must_equal 1914
  end

  it 'returns number of human players' do
      match.human_players.must_equal 10
  end

  it 'returns number of positive votes' do
      match.positive_votes.must_equal 0
  end

  it 'returns number of negative votes' do
      match.negative_votes.must_equal 0
  end

  it 'returns cluster' do
      match.cluster.must_equal 131
  end

  it 'returns game_mode' do
      match.game_mode.must_equal 'All Pick'
  end

  it 'returns lobby type' do
      match.lobby_type.must_equal 'Public matchmaking'
  end
end
