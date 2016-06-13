ActionPortal::Engine.routes.draw do
  root "home#index"

  get 'SERFM', to: 'home#serfm'
  get 'cadastro', to: 'home#cadastro'
  get 'galeria', to: 'home#galeria'
  get 'SERFM_SOL', to: 'home#serfm_sol'
  get 'SERFM_PSOL', to: 'home#serfm_psol'
  get 'mutirao', to: 'home#mutirao'
  resources :cadastres do
    collection  do
      get 'success', path: 'sucesso'
    end
  end
  resources :authorizations
  resources :restrict_areas
end
