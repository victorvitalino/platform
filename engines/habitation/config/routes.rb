Habitation::Engine.routes.draw do

  resources :agendas do
    resources :schedules
  end
end
