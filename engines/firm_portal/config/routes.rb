FirmPortal::Engine.routes.draw do

  get     'authorization',  path: 'acesso', to: 'authorization#new',      as: 'new_authorization'
  post    'authorization',  path: 'acesso', to: 'authorization#create',   as: 'authorization'
  delete  'authorization',  path: 'acesso', to: 'authorization#destroy',  as: 'destroy_authorization'

  resources :enterprise_cadastres, path: 'candidatos'
  resources :enterprise_statuses, path: 'situacao'
  resources :enterprise_units, path: 'enderecos'
  resources :user_companies, path: 'usuarios'
  get 'enable' , to: 'enterprise_cadastres#enable',      as: 'enable_enterprise_cadastres'

  get     'enterprise_statuses/:id/:cadastre_id',  path: 'situacoes', to: 'enterprise_statuses#create',      as: 'create_enterprise_statuses'

end
