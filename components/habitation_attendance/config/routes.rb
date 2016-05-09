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

  namespace :subscribe do 
  end  
end
