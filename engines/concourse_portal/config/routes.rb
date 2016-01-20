ConcoursePortal::Engine.routes.draw do
  default_url_options :host => "localhost:3000" if Rails.env.development? || Rails.env.test?
  default_url_options :host => "www.codhab.df.gov.br"  if Rails.env.production?
  


  resources :projects, path: '/' do 
    
    get  'subscribe_area',       path: "area_candidato",     to: 'candidates#show',                 as: 'subscribe_area'
    get  'subscribe_success',    path: "inscricao_sucesso", to: 'candidates#success',              as: 'subscribes_success'    
    get  'subscribe_logout',     path: "encerrar_sessao",    to: 'candidates#logout',               as: 'subscribes_logout'    
    get  'subscribe_bank_slip',  path: "imprimir_boleto",    to: 'candidates#bank_slip',            as: 'subscribes_bank_slip'
    get  'subscribe_number',     path: "esqueci_inscricao",  to: 'subscribes#remember_subscribe',   as: 'subscribes_remember'
    get  'remember_password/:subscribe_id',    path: "lembrar_senha",      to: 'subscribes#remember_password',    as: 'remember_password'
    get  'subscribe_password',   path: "atualizar_senha",    to: 'passwords#edit',                  as: 'subscribes_password_edit'
    put  'subscribe_password',   path: "atualizar_senha",    to: 'passwords#update',                as: 'subscribes_password_update'

    get 'update_password', to: 'subscribes#edit_password',  as: 'edit_password' 
    post 'update_password', to: 'subscribes#update_password', as: 'update_password'

    resources :pages,           path: '/pagina'
    resources :subscribes,      path: '/inscricao' 
    resources :candidates,      path: '/candidato'
    resources :consults,        path: '/consultas'
  end


end
