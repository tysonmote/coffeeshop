# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "coffeeshop/version"

Gem::Specification.new do |s|
  s.name        = "coffeeshop"
  s.version     = Coffeeshop::VERSION
  s.authors     = ["Tyson Tate"]
  s.email       = ["tyson@tysontate.com"]
  s.homepage    = "http://github.com/tysontate/coffeeshop"
  s.summary     = %q{Simple Sinatra app to serve up CoffeeScript as JavaScript quickly.}
  s.description = %q{coffeeshop is a quick and dirty Sinatra app that serves up any CoffeeScript in a directory as JavaScript. It uses Redis for basic caching because that's how I roll.}

  s.rubyforge_project = "coffeeshop"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  s.add_runtime_dependency "sinatra"
  s.add_runtime_dependency "coffee-script"
  s.add_runtime_dependency "redis"
end

