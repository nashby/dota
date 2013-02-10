module Dota
  class History
    attr_reader :raw_history

    # Initializes a new League object
    #
    # @param raw_history [Hash]
    def initialize(raw_history)
      @raw_history = raw_history
    end

    # The number of results
    #
    # @return [Integer]
    def count
      raw_history['num_results']
    end

    # The total number of results for this particular query
    # (total_count / count) = total number of pages
    #
    # @return [Integer]
    def total_count
      raw_history['total_results']
    end

    # The total number of results for this particular query
    # (total_count / count) = total number of pages
    #
    # @return [Integer]
    def remaining_count
      raw_history['results_remaining']
    end

    def matches
      raw_history['matches'].map do |raw_match|
        Match.new(raw_match)
      end
    end

    # Array of matches
    #
    # @return [Array<Dota::History::Match>] array of Dota::History::Match objects
    class Match
      attr_reader :raw_match

      def initialize(raw_match)
        @raw_match = raw_match
      end
    end
  end
end
