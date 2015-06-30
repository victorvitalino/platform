Helpdesk::Engine.routes.draw do
  
  resources :qualifications
  resources :order_services do 
  	resources :monitor_service_orders
  end	
  resources :statuses
end
