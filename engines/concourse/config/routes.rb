Concourse::Engine.routes.draw do

  resources :projects, path: '/' do 
    resources :pages, path: 'pagina'
  end

  get '/inscricao',      to: 'projects#enrollment'
  get '/area_candidato', to: 'projects#candidate_access'
end
