require 'rails'

module Munna
  class Railtie < Rails::Railtie
    rake_tasks do
    	Dir.glob("#{File.dirname(__FILE__)}/../rake/*.rake", &method(:load))
    end
  end
end
