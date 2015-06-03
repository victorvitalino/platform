Concourse::Engine.routes.draw do
  
  constraints SubdomainConstraint do 
    namespace :administrator, path: '/' do 
    end
  end

  constraints DomainConstraint do 
    namespace :candidate, path: '/' do 
      root 'projects#index'
    end
  end
end
