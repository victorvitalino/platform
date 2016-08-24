ActionPortal::Engine.routes.draw do
  root "home#index"
  get 'cadastro', to: 'home#cadastro'
  get 'galeria', to: 'home#galeria'
  get 'acoes_concluidas', to: 'home#done'
  resources :cadastres do
    collection  do
      get 'success', path: 'sucesso'
    end
  end
  resources :authorizations
  resources :restrict_areas

  namespace :restrict_area do
      resources :inscriptions
      resources :user_social_events do
        get 'mark'
        get 'unmark'
      end
  end
  resources :social_events

end
