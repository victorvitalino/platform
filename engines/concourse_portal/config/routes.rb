ConcoursePortal::Engine.routes.draw do
  resources :projects, path: '/' do 
    resources :pages,         path: '/pagina'
    resources :subscribes,    path: '/inscricao' 
    resources :candidates,    path: '/candidato'
    resources :consults,       path: '/consultas'
  end


end
