require 'dota/configuration'
require 'dota/connection'

require 'dota/match'
require 'dota/league'
require 'dota/live_league'
require 'dota/history'
require 'dota/profile'
require 'dota/ban'
require 'dota/friend'

module Dota
  class Client
    attr_reader :config

    VERSIONS = { 1 => 'V001', 2 => 'V002' }.freeze

    def initialize(options = {})
      @config = Configuration.new(options)
    end

    def configure
      yield config
    end

    def connection
      @connection ||= Connection.new
    end

    # Match details
    #
    # @param [Integer] match id
    # @return [Dota::Match] match object
    def match(id)
      response = run_request('GetMatchDetails', match_id: id)['result']
      Match.new(response) if response
    end

    # The list of matches played
    #
    # @return [Dota::History] match object
    def history(options = {})
      response = run_request('GetMatchHistory', options)['result']
      History.new(response) if response
    end

    # All leagues list
    #
    # @return [Dota::League] league object
    def leagues(options = {})
      response = run_request('GetLeagueListing', options)['result']

      if response && (leagues = response['leagues'])
        leagues.map { |league| League.new(league) }
      end
    end

    # All live leagues list
    #
    # @return [Dota::League] league object
    def live_leagues(options = {})
      response = run_request('GetLiveLeagueGames', options)['result']

      if response && (leagues = response['games'])
        leagues.map { |league| LiveLeague.new(league) }
      end
    end

    # A list of Profile objects.
    # Contained information varies depending on whether or not the user
    # has their profile set to Friends only or Private
    #
    # @param [Integer] SteamId
    #
    # @return [Array<Dota::Profile>] an array of profile objects
    def profiles(*ids)
      response = run_request('GetPlayerSummaries', { steamids: ids.join(',') }, 'ISteamUser', VERSIONS[2])['response']

      if response && (profiles = response['players'])
        profiles.map { |profile| Profile.new(profile) }
      end
    end

    # Profile object
    #
    # @param [Integer] SteamId
    #
    # @return [<Dota::Profile>] profile for given id
    def profile(id)
      profiles = profiles(id)
      profiles && profiles.first
    end

    # List of player ban objects for each given (and valid) 64 bit ID.
    #
    # @param [Integer] SteamId
    # @return [Array<Dota::Ban>] an array of player's bans
    def bans(*ids)
      response = run_request('GetPlayerBans', { steamids: ids.join(',') }, 'ISteamUser')

      if response && (bans = response['players'])
        bans.map { |ban| Ban.new(ban) }
      end
    end

    # List of player's friends
    #
    # @param [Integer] SteamId
    # @return [Array<Dota::Friend>] an array of player's friends
    def friends(id)
      response = run_request('GetFriendList', { steamid: id }, 'ISteamUser')

      if response && (friends = response['friendslist']['friends'])
        friends.map { |friend| Friend.new(friend) }
      end
    end

    # @private
    def run_request(method, options = {}, interface = 'IDOTA2Match_570', api_version = VERSIONS[1])
      url = "https://api.steampowered.com/#{interface}/#{method}/#{api_version}/"
      connection.request(:get, url, options.merge(key: config.api_key))
    end
  end
end
