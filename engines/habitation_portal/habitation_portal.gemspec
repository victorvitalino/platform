$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "habitation_portal/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "habitation_portal"
  s.version     = HabitationPortal::VERSION
  s.authors     = ["Elton Silva"]
  s.email       = ["elton.chrls@gmail.com"]
  s.homepage    = ""
  s.summary     = " HabitationPortal."
  s.description = "of HabitationPortal."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.1"

  s.add_development_dependency "sqlite3"
end
