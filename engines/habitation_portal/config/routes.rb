HabitationPortal::Engine.routes.draw do
  get 'cadastre', path: 'meu-cadastro', to: 'cadastres#show'

  get   'authenticate', path: 'verificacao', to: 'authenticate#new', as: 'new_authenticate'
  post  'authenticate', path: 'verificacao', to: 'authenticate#create', as: 'authenticate'

end
