Regularization::Engine.routes.draw do
  root 'home#index'

  resources :agendas do
    resources :schedules do
      delete 'cancel'
    end
  end

  resources :requeriments, path: 'requerimentos'
  resources :cadastres
  resources :attendances do
    collection do
      post 'verify'
    end
  end
end

