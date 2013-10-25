module Munna
	module Extensions
		module ActiveRecord
			include Basic

			def cached(*opts)
				Proxy::Write.new(Perform::ActiveRecord, self, Helper.normalize_params(opts))
			end

			def delete_cached(*opts)
				Proxy::Delete.new(Perform::ActiveRecord, self, Helper.normalize_params(opts))
			end
		end
	end
end

ActiveRecord::Base.send(:include, Munna::Extensions::ActiveRecord)
ActiveRecord::Base.send(:extend, Munna::Extensions::ActiveRecord)
