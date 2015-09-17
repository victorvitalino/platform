RegularizationTreatment::Engine.routes.draw do

  resources :consults, path: 'consulta'
  
  resources :requeriments, path: 'requerimento' do 
    resources :addresses, path: 'endereco'
    resources :cadastres, path: 'cadastro'
    resources :kins,  path: 'dependentes'
    resources :checklist_treatments, path: 'checklist'
  end

  resources :cadastre_procedural_statuses
  resources :authenticates


end
