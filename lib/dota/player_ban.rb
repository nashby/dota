require 'dota/inspectable'

module Dota
  class PlayerBan
    include Inspectable
    attr_reader :player_ban

    # Initializes a new PlayerBan object
    #
    # @param player_ban [Hash]
    def initialize(player_ban)
      @player_ban = player_ban
    end

    # The player's Steam 64 bit ID
    #
    # @return [Integer]
    def steam_id
      player_ban["SteamId"].to_i
    end

    # Is community banned
    #
    # @return [Boolean]
    def community_banned?
      player_ban["CommunityBanned"]
    end

    # Is community banned
    #
    # @return [Boolean]
    def vac_banned?
      player_ban["VACBanned"]
    end

    # String containing the player's ban status in the economy.
    #
    # @return [String]
    def economy_banned_status
      player_ban['EconomyBan']
    end
  end
end