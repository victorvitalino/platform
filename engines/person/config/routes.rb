Person::Engine.routes.draw do
  resources :jobs, path: 'cargos'
  resources :systems, path: 'sistemas'
  resources :branch_lines, path: 'ramais'
  resources :system_permissions
  resources :sectors, path: 'setores'
  resources :users , path: 'usuarios' do
    get 'enable'
    get 'disable'
    resources :user_permissions do
      get 'enable'
      get 'disable'
    end
  end
end
