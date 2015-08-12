Regularization::Engine.routes.draw do

  constraints DomainConstraint do 
    resources :requeriments do 
      get '/bank_slip', path: 'boleto', to: 'requeriments#bank_slip'
    end
    resources :addresses
    resources :candidate_requeriments do 
      collection do 
        get 'sign_out', path: 'sair', to: 'candidate_requeriments#sign_out'
      end
    end

  end

  constraints SubdomainConstraint do 
    resources :addresses
    resources :bank_slips
    resources :requeriments
  end
end
