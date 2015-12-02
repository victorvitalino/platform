HabitationPortal::Engine.routes.draw do
  get 'cadastre', path: 'meu-cadastro', to: 'cadastres#show'

  get   'authenticate', path: 'verificacao', to: 'authenticate#new', as: 'new_authenticate'
  post  'authenticate', path: 'verificacao', to: 'authenticate#create', as: 'authenticate'

  resources :lists, path: 'listas'
  resources :candidates, path: 'candidato'

  get   '/pesquisa-cpf',  to: 'candidates#find_candidate', as: 'find_candidate'
  post  '/pesquisa-cpf',  to: 'candidates#show_candidate', as: 'show_candidate'
end
