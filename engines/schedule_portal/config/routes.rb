SchedulePortal::Engine.routes.draw do

  get 'info', path: 'info',     to: 'agenda_informations#all',    as: 'all_agenda'
  get 'hour', path: 'horario',  to: 'agenda_informations#hours',  as: 'hour_agenda'

  namespace :regularization, path: 'regularizacao' do 
    resources :agenda_schedules, path: '/' do 
      collection do 
        get 'success', path: 'sucesso'
      end
    end
  end

  namespace :habitation, path: 'habitacao' do
    resources :agenda_schedules, path: '/'
  end 

  namespace :candidate, path: 'candidato' do 
    get   'verify', path: 'verificacao', to: 'verifications#new', as: 'new_verification'
    post  'verify', path: 'verificacao', to: 'verifications#create', as: 'verification'

    resources :schedules, path: 'agendamentos'
  end
end
