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
  spec.summary       = %q{Primarily intended to run as a herkou app, but the sinatra server is modular, and really just a redirect.  The work is done by a rake task calling the gem, which uploads a file to S3.}
  spec.license       = "MIT"

  spec.files         = <<FILES.split($/)
lib/chamberevents/ical.rb
lib/chamberevents/read.rb
lib/chamberevents/scrape.rb
lib/chamberevents/server.rb
lib/chamberevents/upload.rb
lib/chamberevents/version.rb
lib/chamberevents.rb
config.ru
LICENSE.txt
Rakefile
README.md
doc/elginchamber201306.html
FILES
  spec.test_files    = <<TEST.split($/)
spec/chamberevents/ical_spec.rb
spec/chamberevents/read_spec.rb
spec/chamberevents/scrape_spec.rb
spec/spec_helper.rb
TEST
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
