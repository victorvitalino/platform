Concourse::Engine.routes.draw do
  resources :projects do 
    resources :pages
    resources :navs
    resources :subscribes
    resources :participations
    resources :consults
    get '/read', path: 'consulta_lida', as: 'consult_read', to: 'consults#read'
  end
end
