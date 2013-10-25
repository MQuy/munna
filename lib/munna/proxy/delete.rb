module Munna
	module Proxy
		class Delete < Base
			def method_missing(name, *args)
				@kclass.new(@target, @opts, {:name => name, :args => args}).perform_delete
			end
		end
	end
end
