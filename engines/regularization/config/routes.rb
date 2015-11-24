Regularization::Engine.routes.draw do
  root 'home#index'

  resources :agendas do 
    resources :schedules do 
      delete 'cancel'
    end
  end

  resources :attendances
  resources :requeriments

  resources :candidates
  resources :addresses

  resources :resettles
end

