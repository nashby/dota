require 'dota/basic_player'
require 'dota/heroes'
require 'dota/lobbies'

module Dota
  class History
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
        Lobbies[raw_match['lobby_type']]
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

    # Array of players
    #
    # @return [Array<Dota::History::Player>] array of Dota::History::Player objects
    class Player < Dota::BasicPlayer
    end
  end
end
