require 'dota/configuration'
require 'dota/connection'

require 'dota/match'
require 'dota/league'
require 'dota/live_league'
require 'dota/history'

module Dota
  class Client
    attr_reader :config

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
      url = "https://api.steampowered.com/IDOTA2Match_570/GetMatchDetails/V001/"
      response = connection.request(:get, url, { match_id: id, key: config.api_key })

      if result = response['result']
        Match.new(result)
      end
    end

    # The list of matches played
    #
    # @return [Dota::History] match object
    def history(options = {})
      url = "https://api.steampowered.com/IDOTA2Match_570/GetMatchHistory/V001/"
      response = connection.request(:get, url, options.merge(key: config.api_key))

      if result = response['result']
        History.new(result)
      end
    end

    # All leagues list
    #
    # @return [Dota::League] league object
    def leagues(options = {})
      url = "https://api.steampowered.com/IDOTA2Match_570/GetLeagueListing/V001/"
      response = connection.request(:get, url, options.merge(key: config.api_key))

      if response['result'] && (leagues = response['result']['leagues'])
        leagues.map { |league| League.new(league) }
      end
    end

    # All live leagues list
    #
    # @return [Dota::League] league object
    def live_leagues(options = {})
      url = "https://api.steampowered.com/IDOTA2Match_570/GetLiveLeagueGames/V001/"
      response = connection.request(:get, url, options.merge(key: config.api_key))

      if response['result'] && (leagues = response['result']['games'])
        leagues.map { |league| LiveLeague.new(league) }
      end
    end
  end
end
