Candidate::Engine.routes.draw do
  resources :cadastres, path: 'cadastros'
  resources :cadastre_addresses, path: 'enderecos'
  resources :lists
end
