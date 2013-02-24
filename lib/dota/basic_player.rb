require 'dota/constants/heroes'
require 'dota/utils/inspectable'

module Dota
  class BasicPlayer
    include Utils::Inspectable
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

    # Player's slot. If the left-most bit is set, the player was on dire
    #
    # @return [Integer]
    def slot
      raw_player['player_slot']
    end

    # The ID of the hero that the player used
    #
    # @return [Integer]
    def hero_id
      raw_player['hero_id']
    end

    # Hero name
    #
    # @ return [String]
    def hero
      Constants::Heroes[hero_id]
    end
  end
end
