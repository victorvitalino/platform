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
    resources :staff_systems do
      resources :staff_permissions, path: 'permissoes' do
        get 'add'
        get 'remove'
      end
    end
    resource :documents
  end
end
