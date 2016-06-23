Geo::Engine.routes.draw do
  root 'entities#index'

  resources :entities
end
