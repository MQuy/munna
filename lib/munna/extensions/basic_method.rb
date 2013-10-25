module Munna
	module Extensions
		module Basic
			def cached_for(expires_in, options={})
				cached(options.merge(:expires_in => expires_in))
			end
		end
	end
end
