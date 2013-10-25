module Munna
	module Extensions
		module Object
			include Basic

			def cached(*opts)
				Proxy::Write.new(Perform::Object, self, Helper.normalize_params(opts))
			end

			def delete_cached(*opts)
				Proxy::Delete.new(Perform::Object, self, Helper.normalize_params(opts))
			end

			def cached_key
				Munna.get_key [self.class, object_id]
			end
		end
	end
end

Object.send(:include, Munna::Extensions::Object)
Object.send(:extend, Munna::Extensions::Object)
