Person::Engine.routes.draw do
  resources :jobs, path: 'cargos'
  resources :systems, path: 'sistemas' do
    resources :system_permissions, path: 'permissoes' do
     
    end
  end
  resources :sectors, path: 'setores' do
    resources :branch_lines, path: 'ramais'
  end
  resources :profiles
  resources :staffs , path: 'usuarios' do
    get 'enable'
    get 'disable'
    resources :staff_permissions do
      get 'enable'
      get 'disable'
    end
  end
end
