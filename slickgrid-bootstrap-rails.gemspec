# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'slickgrid-bootstrap-rails/version'

Gem::Specification.new do |gem|
  gem.name          = "slickgrid-bootstrap-rails"
  gem.version       = Slickgrid::Bootstrap::Rails::VERSION
  gem.authors       = ["Aki Atoji"]
  gem.email         = ["akiatoji@gmail.com"]
  gem.description   = %q{Rails 3.x integration of SlickGrid with Bootstrap}
  gem.summary       = %q{Rails 3.x integration of SlickGrid with Bootstrap}
  gem.homepage      = "http://github.com/akiatoji/slickgrid-bootstrap-rails"

  gem.add_dependency  "railties", "~> 3.0"
  gem.add_dependency  "jquery-dragdrop-rails"
  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
