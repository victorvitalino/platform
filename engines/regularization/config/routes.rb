Regularization::Engine.routes.draw do
  root 'home#index'

  resources :agendas do 
    resources :schedules do 
      delete 'cancel'
    end
  end
end

