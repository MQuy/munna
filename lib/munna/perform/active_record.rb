module Munna
  module Perform
    class ActiveRecord < Base
      def target_name
        @target.class == Class ? @target.table_name : @target.cache_key
      end

      def method_name
        [super, (send(@execute.name) rescue nil)].compact
      end

      def normalize(values)
        values.is_a?(::ActiveRecord::Relation) ? values.to_a : values
      end

      def method_missing(name, *args, &block)
        if /^all$/ =~ name.to_s
          ActiveRecordMethod.new(@target).send(name)
        else
          super(name, *args, &block)
        end
      end
    end

    class ActiveRecordMethod
      def initialize(target)
        @target = target
      end

      def all
        @target.maximum(:updated_at).to_i
      end
    end
  end
end
