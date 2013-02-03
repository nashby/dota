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

  it 'returns start time' do
    match.start.must_equal Time.at(1342739723)
  end

  it 'returns the winner' do
    match.winner.must_equal :dire
  end

  it 'returns first blood time' do
    match.first_blood.must_equal 133
  end
end
