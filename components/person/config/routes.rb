Person::Engine.routes.draw do

  resources :jobs, path: 'cargos'

  resources :systems, path: 'sistemas' do
    resources :system_permissions, path: 'permissoes' do

    end
  end
  resources :branch_lines, path: 'ramais'
  resources :sectors, path: 'setores' do

  end
  resources :profiles
  resources :staffs , path: 'usuarios' do
    resources :staff_systems do
      resources :staff_permissions, path: 'permissoes' do
        get 'add'
        get 'remove'
      end
    end
    resource :documents
  end
end
