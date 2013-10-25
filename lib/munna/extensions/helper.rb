module Munna
	module Extensions
		module Helper
			def self.normalize_params(params)
				first_element = params.first
				last_element = params.last

				cache_opts = last_element.is_a?(Hash) ? last_element : Hash.new
				if [Symbol, String].include? first_element.class
					cache_opts[:key] = first_element
				end
				cache_opts
			end
		end
	end
end
