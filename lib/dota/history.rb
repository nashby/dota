require 'dota/basic_player'
require 'dota/basic_match'
require 'dota/utils/inspectable'

module Dota
  class History
    include Utils::Inspectable
    attr_reader :raw_history

    # Initializes a new League object
    #
    # @param raw_history [Hash]
    def initialize(raw_history)
      @raw_history = raw_history
    end

    # The number of results
    #
    # @return [Integer]
    def count
      raw_history['num_results']
    end

    # The total number of results for this particular query
    # (total_count / count) = total number of pages
    #
    # @return [Integer]
    def total_count
      raw_history['total_results']
    end

    # The total number of results for this particular query
    # (total_count / count) = total number of pages
    #
    # @return [Integer]
    def remaining_count
      raw_history['results_remaining']
    end

    # Array of matches
    #
    # @return [Array<Dota::History::Match>] array of Dota::History::Match objects
    def matches
      raw_history['matches'].map do |raw_match|
        Match.new(raw_match)
      end
    end

    class Match < Dota::BasicMatch
      # Array of players
      #
      # @return [Array<Dota::History::Player>] array of Dota::History::Player objects
      def players
        raw_match['players'].map do |raw_player|
          Player.new(raw_player)
        end
      end
    end

    # Array of players
    #
    # @return [Array<Dota::History::Player>] array of Dota::History::Player objects
    class Player < Dota::BasicPlayer
    end
  end
end
