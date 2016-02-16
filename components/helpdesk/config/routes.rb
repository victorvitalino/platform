Helpdesk::Engine.routes.draw do

  resources :ticket_types do
    resources :ticket_subjects
    resources :ticket_attendants
  end

  resources :reports

  resources :tickets do
    get 'in_progress',  to: 'tickets#in_progress',  as: 'in_progress'
    get 'closed',       to: 'tickets#closed',       as: 'closed'
    get 'open',         to: 'tickets#open',         as: 'open'
    resources :ticket_comments
  end

  get 'ticket_subjects',      to: 'ticket_subjects#index_json', path: "tickets_json",        as: 'ticket_subjects_json'
  get 'requester_tickets',    to: 'tickets#requester',          path: "minhas_solicitacoes", as: 'ticket_requester'
end
