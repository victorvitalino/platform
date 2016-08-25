Helpdesk::Engine.routes.draw do

  resources :ticket_types, path: "tipo_servicos" do
    resources :ticket_subjects, path: "assuntos"
    resources :ticket_attendants, path: "atendentes"
    resources :ticket_solutions, path: "solucoes"

  end

  resources :reports

  resources :tickets, path: "chamados" do
    get 'in_progress',                  to: 'tickets#in_progress',                 as: 'in_progress'
    get 'closed_ticket',                to: 'ticket_ocurrences#closed_ticket',     as: 'closed_ticket'
    put 'closed',                       to: 'ticket_ocurrences#closed',                      as: 'closed'
    get 'open',                         to: 'tickets#open',                        as: 'open'
    get 'show_requester',               to: 'tickets#show_requester',              as: 'show_requester'

    resources :ticket_ocurrences, path: "ocorrencias"
    get 'transfer_responsible',         to: 'ticket_ocurrences#transfer_responsible',        as: 'transfer_responsible'
    get 'transfer_responsible_ticket',  to: 'ticket_ocurrences#transfer_responsible_ticket', as: 'transfer_responsible_ticket'

    resources :ticket_scheduled_ocurrences, path: "agendas"
  end

  get 'ticket_subjects',      to: 'ticket_subjects#index_json',           path: "tickets_json",           as: 'ticket_subjects_json'
  get 'ticket_solutions',     to: 'ticket_solutions#index_solution_json', path: "tickets_solution_json",  as: 'ticket_solution_json'
  get 'requester_tickets',    to: 'tickets#requester',                    path: "minhas_solicitacoes",    as: 'ticket_requester'
end
