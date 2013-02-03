require 'dota/player'

module Dota
  class Match
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

    # Match's start time
    #
    # @return [Time]
    def start
      Time.at(raw_match['start_time'])
    end

    # The winner of the match
    #
    # @return [Symbol] the winner, :radiant or :dire
    def winner
      raw_match['radiant_win'] ? :radiant : :dire
    end

    # First blood time in seconds from the beginning of the match
    #
    # @return [Integer]
    def first_blood
      raw_match['first_blood_time']
    end

    # Array of players
    #
    # @return [Array<Dota::Player>] array of Dota::Player objects
    def players
      raw_match['players'].map do |raw_player|
        Player.new(raw_player)
      end
    end
  end
end
