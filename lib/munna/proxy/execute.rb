module Munna
  module Proxy
    class Execute
      def initialize(target, object={})
        @target = target
        @object = object
      end

      def name
        @object.is_a?(Proc) ? nil : @object[:name]
      end

      def value
        @value ||= if @object.is_a? Proc
          @object.call
        else
          @target.send @object[:name], *@object[:params]
        end
      end
    end
  end
end
