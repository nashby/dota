module Dota
  module Constants
    module Modes
      MODES = {
                1 => 'All Pick',
                2 => 'Captains Mode',
                3 => 'Random Draft',
                4 => 'Single Draft',
                5 => 'All Random',
                6 => '?? INTRO/DEATH ??',
                7 => 'The Diretide',
                8 => 'Reverse Captains Mode',
                9 => 'Greeviling',
                10 => 'Tutorial',
                11 => 'Mid Only',
                12 => 'Least Played',
                13 => 'New Player Pool'
              }.freeze

      def self.[](id)
        MODES[id]
      end
    end
  end
end
