Firm::Engine.routes.draw do
  resources :companies, path: 'empresas'
  resources :enterprises, path: 'empreendimentos'
  resources :tipologies, path: 'tipologias'

end
