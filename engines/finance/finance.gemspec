$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "finance/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "finance"
  s.version     = Finance::VERSION
  s.authors     = ["Elton Silva"]
  s.email       = ["elton.chrls@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Finance."
  s.description = "TODO: Description of Finance."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.1"
  s.add_dependency "haml-rails"
  s.add_dependency "simple_form"
  s.add_dependency "carrierwave"
  s.add_dependency "barby"
  s.add_dependency "chunky_png"
  s.add_dependency "rqrcode"
  

  s.add_development_dependency "sqlite3"
end
