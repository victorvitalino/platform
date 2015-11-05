EntityPortal::Engine.routes.draw do

  resources :cadastres, path: 'cadastros' do 
    collection do 
      get 'success', path: 'sucesso', as: 'success'
    end
  end

  get 'authorization',  path: 'acesso', to: 'authorization#new',    as: 'new_authorization'
  post 'authorization', path: 'acesso', to: 'authorization#create', as: 'authorization'

  namespace :restrict_area, path: 'area_restrita' do
    resources :cadastres, path: 'cadastro'
    resources :documentations, path: 'documentacao'
  end
end
