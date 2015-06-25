Concourse::Engine.routes.draw do
  
  constraints SubdomainConstraint do 
    namespace :administrator, path: '/' do 
      resources :projects do 
        resources :enrollments do 
          resources :enrollment_fields
        end
        resources :participations
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
      
      root 'projects#index'
      
      resources :candidates,    path: 'candidato'
      resources :sessions,      path: 'acesso'
      resources :passwords,     path: 'senha'
      
      get 'editar_dados', to: 'candidates#edit'
      get 'logout',       to: 'sessions#destroy'

      resources :projects,  path: '/' do 
        resources :pages,   path: 'paginas'
        resources :enrollments, path: 'inscricoes' do 
          resources :enrollment_candidates, path: 'minha_inscricao'
        end
      end
    end
  end
end
