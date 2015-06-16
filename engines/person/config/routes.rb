Person::Engine.routes.draw do
  resources :jobs, path: 'cargos'
  resources :systems, path: 'sistemas'

  resources :system_permissions
  resources :sectors, path: 'setores' do
    resources :branch_lines, path: 'ramais'
  end
  resources :profiles
  resources :users , path: 'usuarios' do
    get 'enable'
    get 'disable'
    resources :user_permissions do
      get 'enable'
      get 'disable'
    end
  end
end
