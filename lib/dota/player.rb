require 'dota/items'

module Dota
  class Player
    attr_reader :raw_player

    def initialize(raw_player)
      @raw_player = raw_player
    end

    def id
      raw_player['account_id']
    end

    def items
      (0..5).map { |i| Items[raw_player["item_#{i}"]] }
    end
  end
end
