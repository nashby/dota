module Dota
  module Constants
    module ProfileStatus
      PROFILE_STATUS = {
          0 => 'Offline', # or profile is private
          1 => 'Online',
          2 => 'Busy',
          3 => 'Away',
          4 => 'Snooze',
          5 => 'Looking to trade',
          6 => 'Looking to play'
      }.freeze

      def self.[](id)
        PROFILE_STATUS[id]
      end
    end
  end
end
