Concourse::Engine.routes.draw do
  
  constraints SubdomainConstraint do 
    namespace :administrator, path: '/' do 
      resources :projects
      resources :project_categories
      resources :reports
    end
  end

  constraints DomainConstraint do 
    namespace :candidate, path: '/' do 
      resources :projects
      root 'projects#index'
    end
  end
end
