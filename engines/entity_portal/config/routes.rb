EntityPortal::Engine.routes.draw do

  root 'authenticate#new'
  
  get   'authenticate', path: 'verificacao', to: 'authenticate#new', as: 'new_authenticate'
  post  'authenticate', path: 'verificacao', to: 'authenticate#create', as: 'authenticate'

  resources :entity_companies, path: 'cooperativas'
end
