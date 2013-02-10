require 'dota/player'
require 'dota/modes'
require 'dota/lobbies'

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

    # The winner of the match
    #
    # @return [Symbol] the winner, :radiant or :dire
    def winner
      raw_match['radiant_win'] ? :radiant : :dire
    end

    # The time at which first blood occurred
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

    # The season of the match
    #
    # @return [Integer]
    def season
      raw_match['season']
    end

    # The duration of the match
    #
    # @return [Integer]
    def duration
      raw_match['duration']
    end

    # The number of human players in the match
    #
    # @return [Integer]
    def human_players
      raw_match['human_players']
    end

    # The number of positive votes
    #
    # @return [Integer]
    def positive_votes
      raw_match['positive_votes']
    end

    # The number of negative votes
    #
    # @return [Integer]
    def negative_votes
      raw_match['negative_votes']
    end

    # The cluster of the match
    #
    # @return [Integer]
    def cluster
      raw_match['cluster']
    end

    # The game mode of the match
    #
    # @return [String]
    def mode
      Modes[raw_match['game_mode']]
    end

    # The type of lobby
    #
    # @return [String]
    def lobby
      Lobbies[raw_match['lobby_type']]
    end

    # The leauge this match is from
    #
    # @return [Integer]
    def league_id
      raw_match['leagueid']
    end

    # @private
    def inspect
      "#<#{self.class.name}:0x#{(object_id << 1).to_s(16)}>"
    end
  end
end
