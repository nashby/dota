module Dota
  class Configuration
    attr_accessor :api_key

    def initialize(options = {})
      options.each_pair do |name, value|
        setter = "#{name}="

        if respond_to?(setter)
          public_send(setter, value)
        end
      end
    end
  end
end
