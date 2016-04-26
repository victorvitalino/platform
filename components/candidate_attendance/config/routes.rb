CandidateAttendance::Engine.routes.draw do

  namespace :habitation do 
    root 'dashboard#index'

    resources :cadastre_attendances do 
      get 'show_apresentation'
      get 'show_cadastre'
      get 'show_checklist'
      get 'show_rejection'
    
      resources :cadastre_mirrors, only: [:edit, :update]
      resources :dependent_mirrors
      resources :checklists, only: [:index] do
        get 'check' 
        get 'uncheck' 
        get 'auth' 
        get 'unauth' 
      end
      
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
