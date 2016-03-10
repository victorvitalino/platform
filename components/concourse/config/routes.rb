Concourse::Engine.routes.draw do

  get 'view_all', path: 'todas_inscricoes', to: 'candidates#view_all', as: 'view_all'
  
  resources :projects do 

    resources :pages
    resources :navs do 
      get 'change_order'
    end

    resources :winners
    resources :subscribes
    resources :participations
    resources :consults
  
    resources :candidates do 
      resources :observations 
      resources :situations
    end
    
    get '/read',      path: 'consulta_lida', as: 'consult_read', to: 'consults#read'
    get '/responded', path: 'consulta_respondida', as: 'consult_responded', to: 'consults#responded'
  
  end
end
