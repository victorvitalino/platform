RegularizationTreatment::Engine.routes.draw do

  resources :consults, path: 'consulta'
  
  resources :requeriments, path: 'requerimento' do 

    resources :addresses, path: 'endereco'
    resources :cadastres, path: 'cadastro'
    resources :kins,  path: 'dependentes'
    resources :checklist_treatments, path: 'checklist'

    get '/address_step',      to: 'attendances#address_step',     path: 'etapa_endereco'
    get '/cadastre_step',     to: 'attendances#cadastre_step',    path: 'etapa_cadastro'
    get '/kin_step',          to: 'attendances#kin_step',         path: 'etapa_dependente'
    get '/checklist_step',    to: 'attendances#checklist_step',   path: 'etapa_checklist'
    get '/supervisor_step',   to: 'attendances#supervisor_step',  path: 'etapa_supervisor'
    get '/replay',            to: 'attendances#replay',           path: 'retormar_atendimento'    
  end


  resources :cadastre_procedural_statuses
  resources :authenticates



end
