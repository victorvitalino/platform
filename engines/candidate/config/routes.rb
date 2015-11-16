Candidate::Engine.routes.draw do
  resources :cadastres, path: 'cadastros'
  resources :lists
end
