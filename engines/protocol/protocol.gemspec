$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "protocol/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "protocol"
  s.version     = Protocol::VERSION
  s.authors     = ["Igor Marques"]
  s.email       = ["igormarjes@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Protocol."
  s.description = "TODO: Description of Protocol."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.1"

  s.add_development_dependency "sqlite3"
end
