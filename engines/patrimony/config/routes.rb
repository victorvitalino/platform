Patrimony::Engine.routes.draw do
  resources :serial_numbers
  resources :goods do

  	resources :drives
  end
  resources :materials
  resources :type_materials
  resources :properties

  
  get '/relatorio/', to: 'reports#index'
  get '/relatorio/propriedade', to: 'reports#codhab'
  
end
