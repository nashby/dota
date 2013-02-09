require 'dota/items'

module Dota
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
      Heroes[hero_id]
    end

    # The number of kills the player got
    #
    # @return [Integer]
    def kills
      raw_player['kills']
    end

    # The number of times the player died
    #
    # @return [Integer]
    def deaths
      raw_player['deaths']
    end

    # The number of assists the player got
    #
    # @return [Integer]
    def assists
      raw_player['assists']
    end

    # K/D/A
    #
    # @return [Array] array of kills, deaths, assists
    def kda
      [kills, deaths, assists]
    end

    # Leaver status
    #
    # @return [Symbol] :bot, :abandoned, :left_safe, :played
    def leaver_status
      case raw_player['leaver_status']
      when 0
        :played
      when 1
        :left_safe
      when 2
        :abandoned
      else
        :bot
      end
    end

    # The amount of gold the player had left at the end of the match
    #
    # @return [Integer]
    def gold
      raw_player['gold']
    end

    # The number of times a player last-hit a creep
    #
    # @return [Integer]
    def last_hits
      raw_player['last_hits']
    end

    # The number of times a player denied a creep
    #
    # @return [Integer]
    def denies
      raw_player['denies']
    end

    # The total amount of gold the player spent over the entire match
    #
    # @return [Integer]
    def gold_spent
      raw_player['gold_spent']
    end

    # The amount of damage the player dealt to heroes
    #
    # @return [Integer]
    def hero_damage
      raw_player['hero_damage']
    end

    # The amount of damage the player dealt to towers
    #
    # @return [Integer]
    def tower_damage
      raw_player['tower_damage']
    end

    # The amount of damage on other players that the player healed
    #
    # @return [Integer]
    def hero_healing
      raw_player['hero_healing']
    end

    # The final level
    #
    # @return [Integer]
    def level
      raw_player['level']
    end

    # The player's total xp/min
    #
    # @return [Integer]
    def xpm
      raw_player['xp_per_min']
    end

    # The player's total gold/min
    #
    # @return [Integer]
    def gpm
      raw_player['gold_per_min']
    end

    # List of items
    #
    # @return [Array<String>] an array of item names
    def items
      (0..5).map { |i| Items[raw_player["item_#{i}"]] }
    end

    # @private
    def inspect
      "#<#{self.class.name}:0x#{(object_id << 1).to_s(16)}>"
    end
  end
end
