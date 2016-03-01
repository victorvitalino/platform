Habitation::Engine.routes.draw do

  resources :agendas do
    resources :schedules do
      delete 'cancel'
    end
  end

  namespace :attendance do
    resources :cadastres
    resources :checklists
    resources :dependents
    resources :attendances
    resources :conclusions
  end
  
  resources :cadastres


  get '/view_update_log/:id', to: 'logs#view_update_log', as: 'view_update_log' 
end
