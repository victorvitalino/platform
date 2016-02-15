Authenticate::Engine.routes.draw do
  resources :staffs, path: 'funcionario' do 
    collection do 
      get 'logout', path: 'sair'
    end
  end
end
