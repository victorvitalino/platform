$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "regularization_schedule/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "regularization_schedule"
  s.version     = RegularizationSchedule::VERSION
  s.authors     = ["Elton Silva"]
  s.email       = ["elton.chrls@gmail.com"]
  s.homepage    = ""
  s.summary     = "Summary of RegularizationSchedule."
  s.description = "Description of RegularizationSchedule."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.1"
  s.add_dependency "rails", "~> 4.2.1"
  s.add_dependency "haml-rails"
  s.add_dependency "simple_form"
  s.add_dependency "carrierwave"
  s.add_dependency "friendly_id"
  
end
