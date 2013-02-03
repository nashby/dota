require 'dota/heroes'

module Dota
  class LiveLeague
    attr_reader :raw_live_league

    # Initializes a new LiveLeague object
    #
    # @param raw_live_league [Hash]
    def initialize(raw_live_league)
      @raw_live_league = raw_live_league
    end

    # League id
    #
    # @return [Integer]
    def id
      raw_live_league['league_id']
    end

    # Array of players
    #
    # @return [Array<Dota::LiveLeague::Player>] array of Dota::LiveLeague::Player objects
    def players
      raw_live_league['players'].map do |raw_player|
        Player.new(raw_player)
      end
    end

    class Player
      attr_reader :raw_player

      # Initializes a new Player object
      #
      # @param raw_player [Hash]
      def initialize(raw_player)
        @raw_player = raw_player
      end

      # Account id
      #
      # @return [Integer]
      def id
        raw_player['account_id']
      end

      # Player's nickname
      #
      # @return [String]
      def name
        raw_player['name']
      end

      # Player's hero name
      #
      # @return [String]
      def hero
        Heroes[hero_id]
      end

      # Player's hero id
      #
      # @return [Integer]
      def hero_id
        raw_player['hero_id']
      end

      # Player's faction
      #
      # @return [Symbol] :dire, :radiant or :broadcaster
      def team
        case raw_player['team']
        when 0
          :radiant
        when 1
          :dire
        else
          :broadcaster
        end
      end
    end
  end
end
