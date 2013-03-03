require 'dota/utils/inspectable'

module Dota
  class Ban
    include Utils::Inspectable
    attr_reader :raw_ban

    # Initializes a new Ban object
    #
    # @param raw_ban [Hash]
    def initialize(raw_ban)
      @raw_ban = raw_ban
    end

    # The player's Steam 64 bit ID
    #
    # @return [Integer]
    def steam_id
      raw_ban['SteamId'].to_i
    end

    # Is community banned
    #
    # @return [Boolean]
    def community_banned?
      raw_ban['CommunityBanned']
    end

    # Is community banned
    #
    # @return [Boolean]
    def vac_banned?
      raw_ban['VACBanned']
    end

    # String containing the player's ban status in the economy.
    #
    # @return [String]
    def economy_banned_status
      raw_ban['EconomyBan']
    end
  end
end
