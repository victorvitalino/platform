RegularizationTreatment::Engine.routes.draw do
  resources :consults
  resources :requeriments
  resources :addresses
  resources :cadastres
  resources :kins
  resources :checklist_treatments
  resources :cadastre_procedural_statuses
  resources :authenticates

end
