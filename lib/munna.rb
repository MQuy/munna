require 'munna/version'
require 'munna/railtie' if defined?(Rails::Railtie)
require 'munna/cache'

module Munna

	class << self
		def cache
			Cache.instance
		end

		def get_key(params)
			if [Symbol, String].include? params.class
				params
			else
				(params.map {|v| v.is_a?(Array) ? v.join('-') : v}).join('/')
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
