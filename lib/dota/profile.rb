require 'dota/utils/inspectable'
require 'dota/constants/community_visibility'
require 'dota/constants/profile_status'

module Dota
  class Profile
    include Utils::Inspectable
    attr_reader :raw_profile

    # Initializes a new Profile object
    #
    # @param raw_profile [Hash]
    def initialize(raw_profile)
      @raw_profile = raw_profile
    end

    # The player's Steam 64 bit ID
    #
    # @return [Integer]
    def id
      raw_profile['steamid'].to_i
    end

    # User's display name
    #
    # @return [String ]
    def person_name
      raw_profile['personaname']
    end

    # The user's real name.
    #
    # @return [String ]
    def real_name
      raw_profile['realname']
    end

    # The 64 bit ID of the user's primary group
    #
    # @return [Integer]
    def clan_id
      raw_profile['primaryclanid']
    end

    # ISO 3166 code of where the user is located
    #
    # @return [String]
    def country_code
      raw_profile['loccountrycode']
    end

    # Variable length code representing the state the user is located in.
    #
    # @return [String]
    def state_code
      raw_profile['locstatecode']
    end

    # Profile date created.
    #
    # @return [Time]
    def created_at
      Time.at(raw_profile['timecreated'])
    end

    # Describes the access setting of the profile
    #
    # @return [String]
    def access_state
      Constants::CommunityVisibility[raw_profile['communityvisibilitystate']]
    end

    # Return true if the user has configured the profile
    #
    # @return [Boolean]
    def configured?
      raw_profile['profilestate'] == 1
    end

    # The user's status
    #
    # @return [String]
    def status
      Constants::ProfileStatus[raw_profile['personastate']]
    end

    # Time user was online
    #
    # @return [Time]
    def last_login
      Time.at(raw_profile['lastlogoff'])
    end

    # The URL to the user's Steam Community profile.
    #
    # @return [String]
    def profile_url
      raw_profile['profileurl']
    end

    # A Link to 32x32 image avatar
    #
    # @return [String]
    def small_avatar_url
      raw_profile['avatar']
    end

    # A Link to 64x64 image avatar
    #
    # @return [String]
    def medium_avatar_url
      raw_profile['avatarmedium']
    end

    # A Link to 184x184 image avatar
    #
    # @return [String]
    def big_avatar_url
      raw_profile['avatarfull']
    end

    # If present the profile allows public comments.
    #
    # @return [Boolean]
    def commentable?
      raw_profile['commentpermission'] == 1
    end

    # If the user is in game this will be set to it's app ID as a string.
    #
    # @return [Integer]
    def game_id
      raw_profile['gameid']
    end

    # The title of the game.
    #
    # @return [String]
    def game_title
      raw_profile['gameextrainfo']
    end

    # Server ip
    #
    # @return [String]
    def game_server_ip
      raw_profile['gameserverip']
    end
  end
end
