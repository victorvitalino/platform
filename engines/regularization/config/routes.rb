Regularization::Engine.routes.draw do

  constraints DomainConstraint do 
    scope(path_names: { new: 'novo', edit: 'editar'}) do

      resources :requeriments, path: 'requerimento' do 
        get '/bank_slip',      path: 'boleto', to: 'requeriments#bank_slip'
      end
      resources :addresses, path: 'endereco'
      resources :candidate_requeriments, path: 'meu_requerimento' do 
        collection do 
          get 'sign_out', path: 'sair', to: 'candidate_requeriments#sign_out'
        end
      end
    end
  end

  constraints SubdomainConstraint do 
    resources :addresses
    resources :bank_slips
    resources :requeriments
  end
end
