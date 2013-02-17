require 'dota/basic_player'
require 'dota/heroes'
require 'dota/inspectable'

module Dota
  class LiveLeague
    include Inspectable
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

    class Player < Dota::BasicPlayer
      # Player's nickname
      #
      # @return [String]
      def name
        raw_player['name']
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
        when 2
          :broadcaster
        end
      end
    end
  end
end
