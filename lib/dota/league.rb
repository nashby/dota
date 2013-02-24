require 'dota/utils/inspectable'

module Dota
  class League
    include Utils::Inspectable
    attr_reader :raw_league

    # Initializes a new League object
    #
    # @param raw_match [Hash]
    def initialize(raw_league)
      @raw_league = raw_league
    end

    # League id
    #
    # @return [Integer]
    def id
      raw_league['leagueid']
    end

    # League name
    #
    # @return [String]
    def name
      raw_league['name']
    end

    # League description
    #
    # @return [String]
    def description
      raw_league['description']
    end

    # Tournament url
    #
    # @return [String]
    def url
      raw_league['tournament_url']
    end
  end
end
