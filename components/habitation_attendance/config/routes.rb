HabitationAttendance::Engine.routes.draw do
  
  namespace :enabled do 
    resources :attendances
    resources :dashboard
    resources :cadastres do 
      get 'checklist'
    end

    resources :dependents
    resources :checklists do 
      get 'enable'
      get 'disable'

      get 'auth'
      get 'unauth'
    end
    resources :finish
  end

  namespace :convoke do 
    resources :dashboard
    resources :attendances
    resources :cadastre_mirrors do 
      resources :dependent_mirrors
      resources :checklists do 
        get 'check'
        get 'uncheck'
      end
    end
  end  
end
