require 'dota/configuration'
require 'dota/connection'

require 'dota/match'
require 'dota/league'
require 'dota/live_league'
require 'dota/history'

module Dota
  class Client
    attr_reader :config

    API_VERSION = 'V001'

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

    # @private
    def run_request method, options = { }, interface = 'IDOTA2Match'
      url      = "https://api.steampowered.com/#{interface}_570/#{method}/#{API_VERSION}/"
      connection.request(:get, url, options.merge(key: config.api_key))
    end
  end
end
