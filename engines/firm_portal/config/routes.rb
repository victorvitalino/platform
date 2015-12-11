FirmPortal::Engine.routes.draw do

  get     'authorization',  path: 'acesso', to: 'authorization#new',      as: 'new_authorization'
  post    'authorization',  path: 'acesso', to: 'authorization#create',   as: 'authorization'
  delete  'authorization',  path: 'acesso', to: 'authorization#destroy',  as: 'destroy_authorization'

  resources :enterprise_cadastres, path: 'candidatos'
  resources :enterprise_statuses, path: 'situacao'
  resources :enterprise_units, path: 'enderecos' do
      resources :cadastre_address, path: 'candidato_unidade'
      post 'book', to:'cadastre_address#book', as: 'book'
  end
  resources :user_companies, path: 'usuarios'
  get 'enable' , to: 'enterprise_cadastres#enable',      as: 'enable_enterprise_cadastres'

  get     'enterprise_statuses/:id/:cadastre_id',  path: 'situacoes', to: 'enterprise_statuses#create',      as: 'create_enterprise_statuses'

  get   'access_data', path: 'dados_acesso', to: 'sessions#edit',    as: 'edit_session'
  put   'access_data/:id', path: 'dados_acesso', to: 'sessions#update',  as: 'session'

end
