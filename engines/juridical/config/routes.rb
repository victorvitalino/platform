Juridical::Engine.routes.draw do
  resources :activities, path: 'atividade'
  resources :process_monitorings, path: 'monitoramento_processo'
  resources :local_instances, path: 'local_instancia'
  resources :instances, path: 'instancia'
  resources :action_types, path: 'tipo_acao'
end
