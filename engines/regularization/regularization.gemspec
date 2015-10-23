$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "regularization/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "regularization"
  s.version     = Regularization::VERSION
  s.authors     = ["Elton Silva"]
  s.email       = ["elton.chrls@gmail.com"]
  s.homepage    = "http://extranet.codhab.df.gov.br"
  s.summary     = "Engine para gestão de regularização interna"
  s.description = "Engine gestora de atendimento, relatórios, processos e etc.. vínculado a regularização"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.1"
end
