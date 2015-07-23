Helpdesk::Engine.routes.draw do
  resources :categories
  resources :statuses
    resources :statuses
  get 'image/:image', as:'get_image',                to: 'monitor_service_orders#get_image'
  
  resources :order_service_users
  resources :order_service_technicals
  resources :order_services do
    resources :qualifications
    resources :monitor_service_orders do
  		get 'assume'
  		get 'close_order_service'
      get 'open_again'
  	end
  end
end
