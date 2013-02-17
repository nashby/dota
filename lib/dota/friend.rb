require 'dota/inspectable'

module Dota
  class Friend
    include Inspectable
    attr_reader :friend

    # Initializes a new Friend object
    #
    # @param friend [Hash]
    def initialize(friend)
      @friend = friend
    end

    # The player's Steam 64 bit ID
    #
    # @return [Integer]
    def steam_id
      friend["steamid"].to_i
    end

    # The friend relationship
    #
    # @return [String]
    def relationship
      friend["relationship"]
    end

    # Time friend since
    #
    # @return [Time]
    def friend_since
      Time.at(friend["friend_since"])
    end
  end
end