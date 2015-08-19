Concourse::Engine.routes.draw do
  resources :projects do 
    resources :pages
    resources :navs
  end
end
