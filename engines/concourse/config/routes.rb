Concourse::Engine.routes.draw do
  
  constraints SubdomainConstraint do 
    namespace :administrator, path: '/' do 
      resources :projects do 
        resources :forms
        resources :form_subscribes
        resources :form_participations
        resources :candidate_field
        resources :pages
        resources :navs do 
          get 'up'
          get 'down'
        end
      end
      resources :project_categories
      resources :reports
    end
  end

  constraints DomainConstraint do 
    namespace :portal, path: '/' do 
      resources :projects, path: '/' do 
        resources :subscribes
        resources :pages
      end
      root 'projects#index'
    end
  end
end
