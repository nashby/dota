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

      # The player's Steam ID
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

      # The ID of the hero that the player used
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

      # @private
      def to_s
        "#<#{self.class.name}:0x#{(object_id << 1).to_s(16)}>"
      end
    end

    # @private
    def to_s
      "#<#{self.class.name}:0x#{(object_id << 1).to_s(16)}>"
    end
  end
end
