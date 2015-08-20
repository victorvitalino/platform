RegularizationSchedule::Engine.routes.draw do

  constraints DomainConstraint do
    namespace :extranet do
      resources :candiade_schedules
    end
  end

  constraints SubdomainConstraint do
    namespace :portal do
      resources :agendas
    end
  end

  resources :agendas, path: 'lista_agendas' do
    resources :schedules , path: 'agendas'
    get 'hour', to: 'finders#hours'
  end
end
