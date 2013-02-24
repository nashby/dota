require 'spec_helper'

describe Dota::Profile do
  let(:profile) { Dota::Profile.new(fixture(:profile)) }

  it 'returns steam id' do
    profile.id.must_equal 76561197993409962
  end

  it 'returns personaname' do
    profile.person_name.must_equal 'Na`Vi.Dendi'
  end

  it 'returns real_name' do
    profile.real_name.must_equal 'Danila'
  end

  it 'returns clan_id' do
    profile.clan_id.must_equal '103582791431060440'
  end

  it 'returns country_code' do
    profile.country_code.must_equal 'UA'
  end

  it 'returns state_code' do
    profile.state_code.must_equal '15'
  end

  it 'returns time_created' do
    profile.created_at.must_equal Time.at(1192440213)
  end

  it 'returns visibility_state' do
    profile.access_state.must_equal 'Friends of Friends'
  end

  it 'returns profile configured status' do
    profile.configured?.must_equal true
  end

  it 'returns profile commentable status' do
    profile.commentable?.must_equal false
  end

  it 'returns status' do
    profile.status.must_equal 'Offline'
  end

  it 'returns last_login' do
    profile.last_login.must_equal Time.at(1361077270)
  end

  it 'returns profile_url' do
    profile.profile_url.must_equal 'http://steamcommunity.com/profiles/76561197993409962/'
  end

  it 'returns small_avatar_link' do
    profile.small_avatar_url.must_equal 'http://media.steampowered.com/steamcommunity/public/images/avatars/ba/ba78600a41a6b93fb805bb8a959835ce7962ff45.jpg'
  end

  it 'returns medium_avatar_link' do
    profile.medium_avatar_url.must_equal 'http://media.steampowered.com/steamcommunity/public/images/avatars/ba/ba78600a41a6b93fb805bb8a959835ce7962ff45_medium.jpg'
  end

  it 'returns big_avatar_link' do
    profile.big_avatar_url.must_equal 'http://media.steampowered.com/steamcommunity/public/images/avatars/ba/ba78600a41a6b93fb805bb8a959835ce7962ff45_full.jpg'
  end

  it 'returns game id' do
    profile.game_id.must_equal nil
  end

  it 'returns game title' do
    profile.game_title.must_equal nil
  end

  it 'returns game_server_ip' do
    profile.game_server_ip.must_equal nil
  end
end
