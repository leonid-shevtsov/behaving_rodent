# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "behaving_rodent/version"

Gem::Specification.new do |s|
  s.name        = "behaving_rodent"
  s.version     = BehavingRodent::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Leonid Shevtsov"]
  s.email       = ["leonid@shevtsov.me"]
  s.homepage    = ""
  s.summary     = %q{A collection of behavioral helpers and matchers for Capybara}
  s.description = %q{A collection of behavioral helpers and matchers for Capybara}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
