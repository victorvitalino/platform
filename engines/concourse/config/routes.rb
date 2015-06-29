Concourse::Engine.routes.draw do
  
  constraints SubdomainConstraint do 
    namespace :administrator, path: '/' do 
      resources :projects, path: 'projetos' do 
        resources :enrollment_candidates, path: 'participantes'
        resources :enrollments, path: "inscricoes" do 
          resources :enrollment_fields, path: 'campos'
        end

        resources :participations, path: 'participacoes' do 
          resources :participation_fields, path: "campos"
        end
        
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
      
      get 'minha_inscricao',  to: 'enrollment_candidates#show'
      get 'editar_inscricao/:enrollment_id', to: 'enrollment_candidates#edit'

      resources :projects,  path: '/' do 
        resources :pages,   path: 'paginas'
        resources :consultations,   path: 'consultas'
        resources :enrollments, path: 'inscricoes' do 
          resources :enrollment_candidates, path: 'inscricoes_efetuadas'
        end

    
      end
    end
  end
end
