module Lita
  module JsonHelper
    class << self
      def load(source)
        MultiJson.load(source, symbolize_keys: true)
      end
    end
  end
end
