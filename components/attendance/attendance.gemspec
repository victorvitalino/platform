$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "attendance/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "attendance"
  s.version     = Attendance::VERSION
  s.authors     = ["Elton Silva"]
  s.email       = ["elton.chrls@gmail.com"]
  s.homepage    = "https://github.com/codhab/platform.git"
  s.summary     = "Summary of Attendance."
  s.description = "Description of Attendance."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.1"

  s.add_development_dependency "sqlite3"
end
