ConcoursePortal::Engine.routes.draw do
  resources :projects, path: '/' do 
    get 'subscribe_area', path: "area_candidato", to: 'candidates#show', as: 'subscribe_area'
    get 'subscribe_success', path: "inscricao_successo", to: 'candidates#success', as: 'subscribes_success'    
    resources :pages,         path: '/pagina'
    resources :subscribes,    path: '/inscricao' 
    resources :candidates,    path: '/candidato'
    resources :consults,       path: '/consultas'
  end


end
