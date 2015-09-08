Attendance::Engine.routes.draw do
  resources :stations do 
    resources :station_attendants
    resources :counters
  end

  resources :attendants
  resources :attendant_counters
  resources :subjects
end
