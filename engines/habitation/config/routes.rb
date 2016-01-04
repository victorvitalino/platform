Habitation::Engine.routes.draw do

  resources :agendas do
    resources :schedules do
      delete 'cancel'
    end
  end

end
