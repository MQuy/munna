require 'munna/version'
require 'munna/railtie' if defined?(Rails::Railtie)
require 'munna/cache'

module Munna

	class << self
		def cache
			Cache.instance
		end

		def get_key(fragments)
			if [Symbol, String].include? fragments.class
				fragments.to_s
			else
				key = ''
				fragments.each do |fragment|
					key += '/' + (fragment.is_a?(Array) ? fragment.join('-') : fragment.to_s)
				end
				key[1..-1]
			end
		end
	end

	KEY = 'Munna'

	module Extensions
		require 'munna/extensions/helper'
		require 'munna/extensions/basic_method'
		require 'munna/extensions/object_method'
		require 'munna/extensions/activerecord_method'
	end

	module Proxy
		require 'munna/proxy/base'
		require 'munna/proxy/execute'
	end

	module Performs
		require 'munna/perform/base'
		require 'munna/perform/object'
		require 'munna/perform/active_record'
	end
end
