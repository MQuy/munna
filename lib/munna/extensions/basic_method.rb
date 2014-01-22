module Munna
	module Extensions
		module Basic
			def cached(*opts, &block)
				Proxy::Write.builder(munna_perform, self, Helper.normalize_params(opts), &block)
			end

			def cached_for(expires_in, *opts, &block)
				Proxy::Write.builder(munna_perform, self, Helper.normalize_params(opts).merge(:expires_in => expires_in), &block)
			end

			def delete_cached(*opts)
				Proxy::Delete.builder(munna_perform, self, Helper.normalize_params(opts))
			end
		end
	end
end
