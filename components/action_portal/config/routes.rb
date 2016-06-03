ActionPortal::Engine.routes.draw do
root "home#index"

resources :cadastres
get 'SERFM', to: 'home#serfm'
get 'cadastro', to: 'home#cadastro'
get 'galeria', to: 'home#galeria'

end
