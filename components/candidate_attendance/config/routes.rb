CandidateAttendance::Engine.routes.draw do

  namespace :habitation do 
    root 'dashboard#index'

    resources :mirrors do 
      resources :cadastres, only: [:edit, :update]
      resources :dependents
      resources :checklists, only: [:index]
      resources :conclusions, only: [:new, :create]
      resources :attendances
    end
    
  end

  namespace :regularization do
    root 'dashboard#index'
  
    resources :mirrors do 
      resources :requeriments
      resources :cadastres
      resources :dependents
      resources :checklists
      resources :conclusions
      resources :attendances
    end
  end

end
