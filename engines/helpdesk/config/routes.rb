Helpdesk::Engine.routes.draw do
  
  resources :statuses
  get 'image/:image', as:'get_image',                to: 'monitor_service_orders#get_image'
<<<<<<< HEAD
  get 'order_service_user',      to: 'order_services#order_service_user'
  get 'order_service_technical', to: 'order_services#order_service_technical'
 
  resources :order_services do
  	resources :monitor_service_orders do
=======
  
  get 'order_service_user',      to: 'order_services#order_service_user'
  get 'order_service_technical', to: 'order_services#order_service_technical'

  resources :order_services do
    resources :qualifications
    resources :monitor_service_orders do
>>>>>>> maxbruno-master
  		get 'assume'
  		get 'close_order_service'
  	end
  end
end
