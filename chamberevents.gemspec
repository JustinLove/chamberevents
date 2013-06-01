# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'chamberevents/version'

Gem::Specification.new do |spec|
  spec.name          = "chamberevents"
  spec.version       = Chamberevents::VERSION
  spec.authors       = ["Justin Love"]
  spec.email         = ["git@JustinLove.name"]
  spec.description   = %q{Scrape Elgin Chamber events and provide an ical feed}
  spec.summary       = %q{Scrape Elgin Chamber events and provide an ical feed}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "nokogiri"
  spec.add_runtime_dependency "icalendar2"
  spec.add_runtime_dependency "sinatra"
  spec.add_runtime_dependency "s3"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "foreman"
end
