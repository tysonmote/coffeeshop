require "coffee-script"
require "digest/md5"
require "redis"
require_relative "coffeeshop/version"

class Coffeeshop
  REDIS = Redis.new
  EXPIRE = 24 * 60 * 60

  def self.to_js( path )
    coffee = File.read( path )
    k = key( digest( coffee ) )
    unless js = REDIS.get( k )
      js = CoffeeScript.compile( coffee )
      REDIS.setex( k, EXPIRE, js )
    end
    js
  end

  def self.digest( text )
    Digest::MD5.hexdigest( text )
  end

  def self.key( digest )
    "coffeeshop:#{digest}"
  end
end
