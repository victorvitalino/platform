Schedule::Engine.routes.draw do
  constraints SubdomainConstraint do 
    namespace :administrator, path: '/' do 
      resources :schedules
    end
  end

  constraints DomainConstraint do 
    namespace :citizen, path: '/' do 
      root 'dashboard#index'
      resources :schedules
      resources :candidates
    end
  end
end
