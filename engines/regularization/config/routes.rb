Regularization::Engine.routes.draw do

  constraints DomainConstraint do 
    resources :requeriments do 
      get '/bank_slip', path: 'boleto', to: 'requeriments#bank_slip'
    end
    resources :addresses
    resources :candidate_requeriments

  end

  constraints SubdomainConstraint do 
    resources :addresses
    resources :bank_slips
    resources :requeriments
  end
end
