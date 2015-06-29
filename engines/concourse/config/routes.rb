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
      resources :passwords,     path: 'senha'
      
      resources :enrollment_candidates,     path: 'inscricao'
      resources :participation_candidates,  path: 'participacao'
      
      resources :projects, path: '/' do 
        resources :enrollments,    path: 'inscricoes'
        resources :pages,          path: 'pagina'
        resources :consultations,  path: 'consultas'
      end
    end
  end
end
