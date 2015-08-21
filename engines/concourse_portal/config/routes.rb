ConcoursePortal::Engine.routes.draw do
  resources :projects, path: '/' do 
    resources :pages,                        path: '/pagina'
    resources :subscribes,                   path: '/inscricao' do 
      resources :candidates,         path: '/candidato'
    end
  end

end
