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

    # Account id
    #
    # @return [Integer]
    def id
      raw_player['account_id']
    end

    # Player slot
    #
    # @return [Integer]
    def slot
      raw_player['player_slot']
    end

    # Hero id
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

    # Amount of kills
    #
    # @return [Integer]
    def kills
      raw_player['kills']
    end

    # Amount of deaths
    #
    # @return [Integer]
    def deaths
      raw_player['deaths']
    end

    # Amount of assists
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
    # @return [Symbol] :bot, :abondoned, :left_safe, :played
    def leaver_status
      case raw_player['leaver_status']
      when 0
        :played
      when 1
        :left_safe
      when 2
        :abondoned
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

    # Amount of last hits
    #
    # @return [Integer]
    def last_hits
      raw_player['last_hits']
    end

    # XP per minute
    #
    # @return [Integer]
    def xpm
      raw_player['xp_per_min']
    end

    # Gold per minute
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
  end
end
