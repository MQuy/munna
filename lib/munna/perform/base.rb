module Munna
	module Perform
		class Base
			def initialize(target, opts, execute)
				@target = target
				@opts = opts
				@execute = execute
			end

			def perform_write
				Munna.cache.write cached_key
				Rails.cache.fetch cached_key, @opts do
					normalize @execute.value
				end
			end

			def perform_delete
				Munna.cache.delete cached_key
			end

			def cached_key
				@cached_key ||= Munna.get_key [target_name, method_name]
			end

			def method_name
				@opts[:key] || @execute.name || @opts[:caller_name]
			end

			def normalize(value)
				value
			end
		end
	end
end
