$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "patrimony/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "patrimony"
  s.version     = Patrimony::VERSION
  s.authors     = ["elton.silva@codhab.df.gov.br"]
  s.email       = ["elton.silva@codhab.df.gov.br"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Patrimony."
  s.description = "TODO: Description of Patrimony."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.1"
  s.add_dependency "haml-rails"

  s.add_development_dependency "sqlite3"
end
