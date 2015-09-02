Candidate::Engine.routes.draw do

  resources :cadastres do 
    collection do 
      get 'consult', path: 'consulta', to: 'cadastres#consult', as: 'consult'
      get 'geo',     path: 'geo',      to: 'cadastres#geo',     as: 'geo' 
    end
  end

  resources :convocations

end
