$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "profile_user/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "profile_user"
  s.version     = ProfileUser::VERSION
  s.authors     = ["Elton Silva"]
  s.email       = ["elton.chrls@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of ProfileUser."
  s.description = "TODO: Description of ProfileUser."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.1"

  s.add_development_dependency "sqlite3"
end
