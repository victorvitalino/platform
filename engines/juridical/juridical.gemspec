$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "juridical/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "juridical"
  s.version     = Juridical::VERSION
  s.authors     = ["maxbruno"]
  s.email       = ["brunomax18@gmail.com"]
  s.homepage    = ""
  s.summary     = "Summary of Juridical."
  s.description = "Description of Juridical."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.1"

  s.add_development_dependency "sqlite3"
end
