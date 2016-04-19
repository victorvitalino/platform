Habitation::Engine.routes.draw do

  resources :agendas do
    resources :schedules do
      delete 'cancel'
    end
  end

  namespace :attendance do
    resources :attendances
    resources :cadastre_mirrors
    
    resources :cadastre_mirror do 
      resources :checklists do 
        get 'check'
        get 'uncheck'

        get 'auth'
        get 'unauth'
      end
      resources :dependent_mirrors
      resources :conclusions
    end
  end
  
  resources :cadastres


  get '/view_update_log/:id', to: 'logs#view_update_log', as: 'view_update_log' 
end
