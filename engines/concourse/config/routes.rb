Concourse::Engine.routes.draw do
  resources :projects do 
    resources :pages
    resources :navs do 
      get 'change_order'
    end

    resources :subscribes
    resources :participations
    resources :consults
    resources :candidates
    
    get '/read', path: 'consulta_lida', as: 'consult_read', to: 'consults#read'
  end
end
