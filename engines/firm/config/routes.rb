Firm::Engine.routes.draw do
  resources :companies, path: 'empresas'
  resources :enterprises, path: 'empreendimentos' do
    resources :enterprise_cadastres, path: 'indicados'
  end
  resources :tipologies, path: 'tipologias'

end
