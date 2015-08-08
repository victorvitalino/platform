$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "helpdesk/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "helpdesk"
  s.version     = Helpdesk::VERSION
  s.authors     = ["Elton Silva"]
  s.email       = ["elton.chrls@gmail.com"]
  s.homepage    = ""
  s.summary     = ": Summary of Helpdesk."
  s.description = ": Description of Helpdesk."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.1"
  s.add_dependency "haml-rails"

  s.add_development_dependency "sqlite3"
end
