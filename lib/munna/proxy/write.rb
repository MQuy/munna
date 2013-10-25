module Munna
	module Proxy
		class Write < Base
			def method_missing(name, *args)
				@kclass.new(@target, @opts, {:name => name, :args => args}).perform_write
			end
		end
	end
end
