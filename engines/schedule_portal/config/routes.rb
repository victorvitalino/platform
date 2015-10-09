SchedulePortal::Engine.routes.draw do

  get 'info', path: 'info',     to: 'agenda_informations#all',    as: 'all_agenda'
  get 'hour', path: 'horario',  to: 'agenda_informations#hours',  as: 'hour_agenda'

  namespace :regularization, path: 'regularizacao' do 
    resources :agenda_schedules, path: '/'
  end

  namespace :habitation, path: 'habitacao' do
    resources :agenda_schedules, path: '/'
  end 
end
