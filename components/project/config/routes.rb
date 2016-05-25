Project::Engine.routes.draw do

  resources :enterprises, path: 'empreendimentos'
  resources :typologies, path: 'tipologias'
end
