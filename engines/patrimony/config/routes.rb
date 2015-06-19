Patrimony::Engine.routes.draw do
  resources :serial_numbers
  resources :goods do
    resources :down_goods
  	resources :drives
  end
  resources :materials
  resources :type_materials
  resources :properties
  resources :down_goods
  
  get '/relatorio/', to: 'reports#index'
  get '/relatorio/index_codhab', to: 'reports#index_codhab'
  get '/relatorio/index_segeth', to: 'reports#index_segeth'
  
end
