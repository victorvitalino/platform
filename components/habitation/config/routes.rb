Habitation::Engine.routes.draw do

  resources :agendas do
    resources :schedules do
      delete 'cancel'
    end
  end

  resources :attendances do 
    collection do 
      get   'create/:id', to: 'attendances#new',      as: 'new'
      get   'update/:id', to: 'attendances#edit',     as: 'edit'
      post  'update/:id', to: 'attendances#update',   as: 'update'

      get   'update_dependent/:id', to: 'attendances#edit_dependent',     as: 'edit_dependent'
      post  'update_dependent/:id', to: 'attendances#update_dependent',   as: 'update_dependent'

      get   'checklist/:id', to: 'attendances#checklist',        as: 'checklist'
      post  'checklist/:id', to: 'attendances#update_checklist', as: 'update_checklist'
      
      get   'finish/:id', to: 'attendances#finish', as: 'finish'
      get   'check/:id',  to: 'attendances#check',  as: 'check'
      post  'check/:id',  to: 'attendances#check_supervisor', as: 'check_supervisor'    
    end
  end
  
  resources :cadastres


  get '/view_update_log/:id', to: 'logs#view_update_log', as: 'view_update_log' 
end
