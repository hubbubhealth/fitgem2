# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
$:.push File.join(File.dirname(__FILE__), '.', 'lib')

require 'fitgem2/version'

Gem::Specification.new do |s|
  s.name        = 'fitgem2'
  s.version     = Fitgem::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Richard Wardin', 'Zachery Moneypenny (original)']
  s.email       = ['shalmezad@gmail.com']
  s.homepage    = 'http://github.com/shalmezad/fitgem'
  s.summary     = %q{OAuth2 client library to the data on fitbit.com}
  s.description = %q{A client library to send and retrieve workout, weight, and diet data from fitbit.com}

  s.rubyforge_project = 'fitgem2'

  s.add_dependency 'oauth2'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec',     '~> 3.0.0'
  s.add_development_dependency 'yard'
  s.add_development_dependency 'rdiscount'

  if RUBY_VERSION < "2.0"
    #JSON is not in ruby < 2.0 by default:
    s.add_dependency 'json'
  end

  s.files = %w(LICENSE README.md fitgem2.gemspec) + `git ls-files -z`.split("\x0").select { |f| f.start_with?("lib/") }
  s.require_paths = ['lib']
end
