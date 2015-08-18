Concourse::Engine.routes.draw do
  resources :projects do 
    resources :pages
  end
end
