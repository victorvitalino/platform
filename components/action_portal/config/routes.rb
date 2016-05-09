ActionPortal::Engine.routes.draw do
root "home#index"
get 'SERFM', to: 'home#serfm'
get 'cadastro', to: 'home#cadastro'
end
