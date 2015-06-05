Concourse::Engine.routes.draw do
  
  constraints SubdomainConstraint do 
    namespace :administrator, path: '/' do 
      resources :projects do 
        resources :forms
        resources :candidate_field
      end
      resources :project_categories
      resources :reports
    end
  end

  constraints DomainConstraint do 
    namespace :portal, path: '/' do 
      resources :projects
      root 'projects#index'
    end
  end
end
