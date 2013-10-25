namespace :munna do
  desc "Clear dalli cache"
  task :clear => :environment do
    Munna.cache.clear
  end

  task :values => :environment do
  	puts Munna.cache.values
  end
end
