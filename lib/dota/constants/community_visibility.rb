module Dota
  module Constants
    module CommunityVisibility
      COMMUNITY_VISIBILITY = {
          1 => 'Private',
          2 => 'Friends only',
          3 => 'Friends of Friends',
          4 => 'Users Only',
          5 => 'Public'
      }.freeze

      def self.[](id)
        COMMUNITY_VISIBILITY[id]
      end
    end
  end
end
