Habitation::Engine.routes.draw do

  resources :agendas do
    resources :schedules do
      delete 'cancel'
    end
  end

  resources :cadastres

  get '/view_update_log/:id', to: 'logs#view_update_log', as: 'view_update_log' 
end
