Concourse::Engine.routes.draw do
  root 'dashboard#index'

  constraints SubdomainConstraint do 
    namespace :administrator, path: '/' do 
      resources :projects
    end
  end

  constraints DomainConstraint do 
    namespace :candidate, path: '/' do 
      resources :projects
    end
  end
end
