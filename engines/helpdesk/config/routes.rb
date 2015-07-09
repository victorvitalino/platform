Helpdesk::Engine.routes.draw do
  
  resources :qualifications
  resources :order_services
  resources :statuses
  get 'image/:image', as:'get_image',                to: 'monitor_service_orders#get_image'
  get 'order_service_user',      to: 'order_services#order_service_user'
  get 'order_service_technical', to: 'order_services#order_service_technical'
 
  resources :order_services do
  	resources :monitor_service_orders do
  		get 'assume'
  		get 'close_order_service'
  	end
  end
end
