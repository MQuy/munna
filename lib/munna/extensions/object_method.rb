module Munna
  module Extensions
    module Object
      include Basic

      def cached_key
        Munna.get_key [self.class, object_id]
      end

      def munna_perform
        Perform::Object
      end
    end
  end
end

Object.send(:include, Munna::Extensions::Object)
Object.send(:extend, Munna::Extensions::Object)
