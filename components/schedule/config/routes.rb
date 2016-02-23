Schedule::Engine.routes.draw do
  resources :agendas do 
    resources :agenda_schedules, path: 'agendamentos'
  end
end
