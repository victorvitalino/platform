Helpdesk::Engine.routes.draw do
  resources :categories, path: 'categorias'
  resources :statuses,  path: 'status'
  get 'image/:image', as:'get_image',                to: 'monitor_service_orders#get_image'
  
  resources :order_service_users, path: 'usuario'
  resources :order_service_technicals, path: 'tecnico'
  resources :order_services , path: 'os' do
    resources :qualifications, path: 'qualificacao'
    resources :monitor_service_orders, path: 'acompanhameto' do
  		get 'assume'
  		get 'close_order_service'
      get 'open_again'
  	end
  end
end
