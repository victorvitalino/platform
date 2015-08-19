Concourse::Engine.routes.draw do
  resources :projects do 
    resources :pages
    resources :navs
    resources :subscribes
    resources :participations
  end
end
