Regularization::Engine.routes.draw do
  root 'home#index'

  resources :agendas do 
    resources :schedules
  end
end

