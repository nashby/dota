require 'dota/utils/inspectable'
require 'dota/constants/lobbies'

module Dota
  class BasicMatch
    include Utils::Inspectable
    attr_reader :raw_match

    # Initializes a new Match object
    #
    # @param raw_match [Hash]
    def initialize(raw_match)
      @raw_match = raw_match
    end

    # Match id
    #
    # @return [Integer]
    def id
      raw_match['match_id']
    end

    # Match sequence number
    #
    # @return [Integer]
    def seq_num
      raw_match['match_seq_num']
    end

    # Match's start time
    #
    # @return [Time]
    def start
      Time.at(raw_match['start_time'])
    end

    # The type of lobby
    #
    # @return [String]
    def lobby
      Constants::Lobbies[raw_match['lobby_type']]
    end
  end
end
