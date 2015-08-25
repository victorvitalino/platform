ConcoursePortal::Engine.routes.draw do
  resources :projects, path: '/' do 
    
    get 'subscribe_area',       path: "area_candidato",     to: 'candidates#show',      as: 'subscribe_area'
    get 'subscribe_success',    path: "inscricao_successo", to: 'candidates#success',   as: 'subscribes_success'    
    get 'subscribe_logout',     path: "encerrar_sessao",    to: 'candidates#logout',    as: 'subscribes_logout'    
    get 'subscribe_bank_slip',  path: "imprimir_boleto",    to: 'candidates#bank_slip', as: 'subscribes_bank_slip'
    get 'subscribe_number',     path: "esqueci_inscricao",  to: 'subscribes#remember_subscribe',  as: 'subscribes_remember'
    get 'subscribe_password',   path: "esqueci_senha",      to: 'subscribes#remember_password',   as: 'subscribes_password'

    resources :pages,         path: '/pagina'
    resources :subscribes,    path: '/inscricao' 
    resources :candidates,    path: '/candidato'
    resources :consults,       path: '/consultas'
  end


end
