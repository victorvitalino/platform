EntityPortal::Engine.routes.draw do

#  resources :cadastres, path: 'cadastros' do
#    collection do
#      get 'success', path: 'sucesso', as: 'success'
#    end
#  end

  resources :olds, path: 'entidades_anteriores'

#  get     'authorization',  path: 'acesso', to: 'authorization#new',      as: 'new_authorization'
#  post    'authorization',  path: 'acesso', to: 'authorization#create',   as: 'authorization'
  
#  delete  'authorization',  path: 'acesso', to: 'authorization#destroy',  as: 'destroy_authorization'

#  get     'remember_password', path: 'lembrar-senha', to: 'cadastres#remember_password'
#  post    'send_password', path: 'lembrar-senha', to: 'cadastres#send_password' 

=begin 
  namespace :restrict_area, path: 'area_restrita' do
    get   'access_data', path: 'dados_acesso', to: 'session#edit',    as: 'edit_session'
    put   'access_data/:id', path: 'dados_acesso', to: 'session#update',  as: 'session'

    get   'document_categories', to: 'infos#document_categories', as: 'document_categories'

    resources :cadastres, path: 'cadastro'
    resources :documentations, path: 'documentacao'
    resources :members, path: 'membros'
    resources :checklists, path: 'checklist'
    resources :realties, path: 'bens'
  end
=end

end
