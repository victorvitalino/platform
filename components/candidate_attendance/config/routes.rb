CandidateAttendance::Engine.routes.draw do

  namespace :habitation do 
    root 'dashboard#index'

    resources :attendances, only: [:new, :index] do 
      get 'show_apresentation'
      get 'show_cadastre'
      get 'show_checklist'
      get 'show_rejection'
    end


    resources :cadastre_attendances do
      resources :cadastre_mirrors, only: [:edit, :update]
      resources :dependent_mirrors
      resources :checklists, only: [:index]
      resources :finishs, only: [:new, :create]
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
