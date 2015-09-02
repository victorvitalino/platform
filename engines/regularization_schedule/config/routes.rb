RegularizationSchedule::Engine.routes.draw do

  constraints DomainConstraint do

    namespace :portal, path: '/' do
      resources :agendas, path: 'agendas' do
       get 'hour', to: 'finders#hours'
       resources :schedules, path: 'agendamento'
      end

    end
  end

  constraints SubdomainConstraint do
    namespace :extranet do
      resources :agendas, path: 'lista_agendas' do
       resources :schedules , path: 'agendas'
      end
    end
  end
end
