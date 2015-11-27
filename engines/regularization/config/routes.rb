Regularization::Engine.routes.draw do
  root 'home#index'

  resources :agendas do 
    resources :schedules do 
      delete 'cancel'
    end
  end

  resources :attendances do
    collection do 
      get   'step_one/:requeriment_id', path: 'primeira_etapa', to: 'attendances#step_one', as: 'step_one'
      post  'step_one', path: 'primeira_etapa', to: 'attendances#create_step_one', as: 'create_step_one'

      get   'step_two', path: 'segunda_etapa', to: 'attendances#step_two', as: 'step_two'
      post  'step_two', path: 'segunda_etapa', to: 'attendances#create_step_two', as: 'create_step_two'
      put   'step_two', path: 'segunda_etapa', to: 'attendances#update_step_two', as: 'update_step_two'

      get   'step_three', path: 'terceira_etapa', to: 'attendances#step_three', as: 'step_three'
      post  'step_three', path: 'terceira_etapa', to: 'attendances#create_step_three', as: 'create_step_three'

      get   'redirect', path: 'redirecionar',   to: 'attendances#redirect_step', as: 'redirect_step'
    end
    
 
  end
  resources :requeriments
  resources :candidates
  resources :addresses
  resources :resettles
end

