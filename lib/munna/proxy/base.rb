module Munna
	module Proxy
		class Base
			def initialize(kclass, target, options={})
				@kclass = kclass
				@target = target
				@opts = options
			end
		end
	end
end
