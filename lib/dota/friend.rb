require 'dota/utils/inspectable'

module Dota
  class Friend
    include Utils::Inspectable
    attr_reader :raw_friend

    # Initializes a new Friend object
    #
    # @param raw_friend [Hash]
    def initialize(raw_friend)
      @raw_friend = raw_friend
    end

    # The player's Steam 64 bit ID
    #
    # @return [Integer]
    def steam_id
      raw_friend['steamid'].to_i
    end

    # The friend relationship
    #
    # @return [String]
    def relationship
      raw_friend['relationship']
    end

    # Time friend since
    #
    # @return [Time]
    def friend_since
      Time.at(raw_friend['friend_since'])
    end
  end
end
