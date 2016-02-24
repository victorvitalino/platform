Habitation::Engine.routes.draw do

  resources :agendas do
    resources :schedules do
      delete 'cancel'
    end
  end

  resources :attendances do 
    collection do

      #cadastre 
      get     'new_cadastre/:id',       to: 'attendances#new_cadastre',      as: 'new_cadastre'
      get     'edit_cadastre/:id',      to: 'attendances#edit_cadastre',     as: 'edit_cadastre'
      post    'update_cadastre/:id',    to: 'attendances#update_cadastre',   as: 'update_cadastre'
      delete  'destroy_cadastre/:id',   to: 'attendances#destroy_cadastre',  as: 'destroy_cadastre'

      #dependents
      get   'index_dependent/:id', to: 'attendances#index_dependent',    as: 'index_dependent'
      
      get   'new_dependent/:id',   to: 'attendances#new_dependent',      as: 'new_dependent'
      post  'new_dependent/:id',   to: 'attendances#create_dependent',   as: 'create_dependent'
      
      get   'update_dependent/:id', to: 'attendances#edit_dependent',     as: 'edit_dependent'
      post  'update_dependent/:id', to: 'attendances#update_dependent',   as: 'update_dependent'

      delete   'destroy_dependent/:id', to: 'attendances#destroy_dependent',     as: 'destroy_dependent'
      #checklist
      get   'checklist/:id', to: 'attendances#checklist',        as: 'checklist'
      post  'checklist/:id', to: 'attendances#update_checklist', as: 'update_checklist'
      
      #attendant finish
      get   'finish/:id', to: 'attendances#finish', as: 'finish'
      
      #supervisor finish
      post  'check/:id',  to: 'attendances#check_supervisor', as: 'check_supervisor'    
      
      #attentance :show
      get   'check/:id',  to: 'attendances#check',  as: 'check'
    end
  end
  
  resources :cadastres


  get '/view_update_log/:id', to: 'logs#view_update_log', as: 'view_update_log' 
end
