module Munna
  module Perform
    class Object < Base
      def target_name
        @target.class.is_a?(Class) ? @target.name : @target.cached_key
      end
    end
  end
end
