$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "sefaz/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "sefaz"
  s.version     = Sefaz::VERSION
  s.authors     = ["Igor Marques"]
  s.email       = ["igormarjes@gmail.com"]
  s.homepage    = ""
  s.summary     = "Summary of Sefaz."
  s.description = "Description of Sefaz."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.1"

  s.add_development_dependency "sqlite3"
end
