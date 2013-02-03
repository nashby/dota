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
