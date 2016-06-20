ActionPortal::Engine.routes.draw do
  root "home#index"

  get 'SERFM', to: 'home#serfm'
  get 'cadastro', to: 'home#cadastro'
  get 'galeria', to: 'home#galeria'
  get 'SERFM_SOL', to: 'home#serfm_sol'
  get 'SERFM_PSOL', to: 'home#serfm_psol'
  get 'mutirao', to: 'home#mutirao'
  get 'acao_urbana_buritizinho', to: 'home#acao_urbana_buri'
  get 'acao_urbana_sao_sebastiao', to: 'home#acao_urbana_sao'
  get 'serfm_buritizinho', to: 'home#serfm_buri'
  resources :cadastres do
    collection  do
      get 'success', path: 'sucesso'
    end
  end
  resources :authorizations
  resources :restrict_areas
end
