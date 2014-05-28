# Munna

Simple cache wrapper for rails ActiveRecord, Object, ... to speed up your site

### Installation

Add this line to your application's Gemfile:

	gem 'munna'

### Usage

#### ActiveRecord

``` ruby
class Profile < ActiveRecord::Base
	after_destroy :clear_cache

	def clear_cache
		User.delete_cached :list_with_profiles
	end
end

class User < ActiveRecord::Base
	has_many :profiles

	def self.list_with_profiles
		cached {
			join(:profiles)
			.group('users.id')
			.select('users.*, count(users.id)')
		}
	end

	# get random 5 rows, cache for 10.hours
	def self.list_by_random
		cached_for 10.hours {
			order('rand(id)').limit(5)
		}
	end
end
```

``` ruby
User.cached.all # get all users at the first time, after that fetch from cache
```

#### Advanced Options
Everything in rails can be cached through **cached**, **cached_for** and remove through **delete_cached**

##### 1. cached vs delete_cached

| cached                     									 | delete_cached                   		 |
| -------------------------------------------- | ----------------------------------- |
| Anything.cached(opts).function   						 | Anything.delete_cached.function 		 |
| Anything.cached(:name, opts).function 			 | Anything.delete_cached :name 			 |
| Anything.cached([:name, :id], opts).function | Anything.delete_cached [:name, :id] |
| Anything.cached {}                           | Anything.delete_cached caller_name   |
| Anything.cached(:name, opts) { ... }         | Anything.delete_cached :name        |
| Anything.cached([:name, :id], opts) { ... }  | Anything.delete_cached [:name, :id] |


##### 2. cached_for: is the quite similar to cached, with shortcut for expires_in
``` ruby
Anything.cached_for(10.hours, opts).function
Anything.cached_for(10.hours, opts) {}
```

* ***opts*** is optional, you can ignore it
* ***caller_name*** is the function name that line belong to

##### 3. opts: is a ```Hash```, has options
	* expires_in: time to expire
	* key: cached key for save and use for ***delete_cached***

#### 4. cache support
``` ruby
Munna.cache.values # => list all key in memcached
Munna.cache.clear # => clear all value, key in memcached
Munna.cache.get_matched /xxx/ # => get values with satify regex
Munna.cache.delete_matched /xxx/ # => delete values with satify regex
```
