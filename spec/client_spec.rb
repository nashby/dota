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

  it 'returns leagues' do
    stub_request(:get,  'https://api.steampowered.com/IDOTA2Match_570/GetLeagueListing/V001/?key=TEST_API_KEY').
      to_return(status: 200, body: fixture(:league_listing))

    leagues = client.leagues
    leagues.must_be_kind_of Array
    leagues.first.must_be_kind_of Dota::League
  end

  it 'returns nil if there are no leagues' do
    stub_request(:get,  'https://api.steampowered.com/IDOTA2Match_570/GetLeagueListing/V001/?key=TEST_API_KEY').
      to_return(status: 200, body: {})

    leagues = client.leagues
    leagues.must_be_nil
  end

  it 'returns live leagues' do
    stub_request(:get,  'https://api.steampowered.com/IDOTA2Match_570/GetLiveLeagueGames/V001/?key=TEST_API_KEY').
      to_return(status: 200, body: fixture(:live_league_games))

    live_leagues = client.live_leagues
    live_leagues.must_be_kind_of Array
    live_leagues.first.must_be_kind_of Dota::LiveLeague
  end

  it 'returns nil if there are no live leagues' do
    stub_request(:get,  'https://api.steampowered.com/IDOTA2Match_570/GetLiveLeagueGames/V001/?key=TEST_API_KEY').
      to_return(status: 200, body: {})

    live_leagues = client.live_leagues
    live_leagues.must_be_nil
  end
end
