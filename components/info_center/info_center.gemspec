$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "info_center/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "info_center"
  s.version     = InfoCenter::VERSION
  s.authors     = ["Victor Vitalino"]
  s.email       = ["vitalino.victor@gmail.com"]
  s.homepage    = ""
  s.summary     = "Summary of InfoCenter."
  s.description = "Description of InfoCenter."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.1"

  s.add_development_dependency "sqlite3"
end
