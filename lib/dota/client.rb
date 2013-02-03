require 'dota/configuration'
require 'dota/connection'

require 'dota/match'

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
      url = "https://api.steampowered.com/IDOTA2Match_570/GetMatchDetails/V001/?key=#{config.api_key}"
      response = connection.request(:get, url, match_id: id)

      if result = response['result']
        Match.new(result)
      end
    end
  end
end
