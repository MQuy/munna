module Munna
  module Extensions
    module ActiveRecord
      include Basic

      def munna_perform
        Perform::ActiveRecord
      end
    end
  end
end

ActiveRecord::Base.send(:include, Munna::Extensions::ActiveRecord)
ActiveRecord::Base.send(:extend, Munna::Extensions::ActiveRecord)
