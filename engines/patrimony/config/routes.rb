Patrimony::Engine.routes.draw do
  resources :serial_numbers
  resources :goods do
    resources :drives
    resources :down_goods
  end
  resources :materials
  resources :type_materials
  resources :properties
  
  get '/relatorio/', to: 'reports#index'
  get '/relatorio/index_codhab', to: 'reports#index_codhab'
  get '/relatorio/index_segeth', to: 'reports#index_segeth'
  

end
