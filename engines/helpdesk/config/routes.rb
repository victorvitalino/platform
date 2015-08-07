Helpdesk::Engine.routes.draw do
  get 'image/:image', as:'get_image',                to: 'monitor_service_orders#get_image'
  resources :attendants, path: 'atendente'
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
  resources :report_attendants, path: 'relatorio_por_atendente'
  resources :report_sectors,    path: 'relatorio_por_setor'
  resources :report_employees,  path: 'relatorio_por_funcionario'
  resources :report_requests,   path: 'relatorio_por_tipo'
  resources :report_machines,   path: 'relatorio_por_maquina'
end
