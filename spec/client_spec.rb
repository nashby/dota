require 'spec_helper'

describe Dota::Client do
  it 'returns match' do
    stub_request(:get,  'https://api.steampowered.com/IDOTA2Match_570/GetMatchDetails/V001/?key=TEST_API_KEY&match_id=27110133').
      to_return(status: 200, body: fixture(:match))

    match = client.match(27110133)
    match.must_be_kind_of Dota::Match
  end

  it 'returns nil if there is no match for current id' do
    stub_request(:get,  'https://api.steampowered.com/IDOTA2Match_570/GetMatchDetails/V001/?key=TEST_API_KEY&match_id=27110133').
      to_return(status: 200, body: {})

    match = client.match(27110133)
    match.must_be_nil
  end
end
