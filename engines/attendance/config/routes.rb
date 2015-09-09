Attendance::Engine.routes.draw do
  resources :stations do 
    resources :station_attendants
    resources :counters
  end
  
  
  get 'counters', to: 'stations#counters'
  
  resources :attendants
  resources :counter_attendants
  resources :subjects
end
