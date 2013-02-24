module Dota
  module Utils
    module Inspectable
      # @private
      def inspect
        "#<#{self.class.name}:0x#{(object_id << 1).to_s(16)}>"
      end
    end
  end
end
