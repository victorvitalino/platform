Regularization::Engine.routes.draw do

  constraints DomainConstraint do 
    resources :requeriments
    resources :addresses
    resources :bank_slips
    resources :candidate_requeriments
  end

  constraints SubdomainConstraint do 
    resources :addresses
    resources :bank_slips
    resources :requeriments
  end
end
