module Munna
  module Proxy
    class Base
      def initialize(kclass, target, options={}, &block)
        @kclass = kclass
        @target = target
        @opts = options
      end

      def method_missing(name, *args, &block)
        __perform__ Execute.new @target, {:name => name, :args => args, :block => block}
      end

      def __perform__(execute)
        @kclass.new(@target, @opts, execute).send("perform_#{self.class.name.demodulize.downcase}")
      end
    end

    class Write < Base
      def self.builder(kclass, target, options={}, &block)
        instance = new kclass, target, options, &block
        block.present? ? instance.__perform__(Execute.new target, block) : instance
      end
    end

    class Delete < Base
      def self.builder(kclass, target, options={}, &block)
        instance = new kclass, target, options, &block
        options[:key].present? ? instance.__perform__(Execute.new target) : instance
      end
    end
  end
end
