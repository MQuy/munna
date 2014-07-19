module Munna
  module Extensions
    module Helper
      def self.normalize_params(params)
        first_element = params.first
        last_element = params.last

        cache_opts = last_element.is_a?(Hash) ? last_element : Hash.new
        cache_opts[:caller_name] = caller_locations(2,1)[0].label
        if [Symbol, String, Array].include? first_element.class
          cache_opts[:key] = Munna.get_key first_element
        end

        cache_opts
      end
    end
  end
end
