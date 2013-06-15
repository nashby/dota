require 'dota/utils/inspectable'

module Dota
  class Team
    include Utils::Inspectable
    attr_reader :raw_team

    # Initializes a new Team object
    #
    # @param raw_team [Hash]
    def initialize(raw_team)
      @raw_team = raw_team
    end

    # Team's id
    #
    # @return [Integer]
    def id
      raw_team['team_id']
    end

    # Team's name
    #
    # @return [String]
    def name
      raw_team['team_name']
    end

    # Team's logo
    #
    # How to fetch resource: http://dev.dota2.com/showthread.php?t=71363&p=462059&viewfull=1#post462059
    #
    # @return [Integer]
    def logo
      raw_team['team_logo']
    end

    # Team completeness
    #
    # @return [Boolean] true if all players belong to this team, false otherwise
    def complete?
      raw_team['complete']
    end
  end
end
