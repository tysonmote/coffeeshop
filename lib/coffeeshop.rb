require "bundler"
require "coffee-script"
require "digest/md5"
require "redis"
require_relative "coffeeshop/version"

module Coffeeshop
  REDIS = Redis.new
  EXPIRE = 60 * 60

  def self.to_js( path )
    coffee = File.read( path )
    k = key( digest( coffee ) )
    unless js = REDIS.get( k )
      js = CoffeeScript.compile( coffee )
      REDIS.set( k, js )
    end
    REDIS.expire( k, EXPIRE )
    js
  end

  def self.digest( text )
    Digest::MD5.hexdigest( text )
  end

  def self.key( digest )
    "coffeeshop:#{digest}"
  end
end

