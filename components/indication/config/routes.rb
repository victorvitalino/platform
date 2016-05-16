Indication::Engine.routes.draw do

  resources :cadastres,  path: 'indicados'
  resources :allotments, path: 'lotes'
end
