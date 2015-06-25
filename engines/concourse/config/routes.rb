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
      resources :candidates,    path: 'candidato'
      
      get 'editar_dados', to: 'candidates#edit'

      resources :sessions,      path: 'acesso'
      
      get 'logout', to: 'sessions#destroy'

      resources :passwords,     path: 'senha'
      resources :projects, path: '/' do 
        resources :pages
      end
      root 'projects#index'
    end
  end
end
