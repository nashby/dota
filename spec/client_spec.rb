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

  it 'returns friends' do
    stub_request(:get,  'https://api.steampowered.com/ISteamUser/GetFriendList/V001/?key=TEST_API_KEY&steamid=123').
      to_return(status: 200, body: fixture(:friends))

    friends = client.friends(123)
    friends.must_be_kind_of Array
    friends.first.must_be_kind_of Dota::Friend
  end

  it 'returns bans' do
    stub_request(:get,  'https://api.steampowered.com/ISteamUser/GetPlayerBans/V001/?key=TEST_API_KEY&steamids=123').
      to_return(status: 200, body: fixture(:bans))

    bans = client.bans(123)
    bans.must_be_kind_of Array
    bans.first.must_be_kind_of Dota::Ban
  end

  it 'returns profiles' do
    stub_request(:get,  'https://api.steampowered.com/ISteamUser/GetPlayerSummaries/V002/?key=TEST_API_KEY&steamids=123').
      to_return(status: 200, body: fixture(:profiles))

    profiles = client.profiles(123)
    profiles.must_be_kind_of Array
    profiles.first.must_be_kind_of Dota::Profile
  end

  it 'returns one profile' do
    stub_request(:get,  'https://api.steampowered.com/ISteamUser/GetPlayerSummaries/V002/?key=TEST_API_KEY&steamids=123').
      to_return(status: 200, body: fixture(:profiles))

    profile = client.profile(123)
    profile.must_be_kind_of Dota::Profile
  end
end
