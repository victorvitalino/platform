class SubdomainConstraint
  def self.matches?(request)
    permitted = 'extranet'
    request.subdomain.include? permitted
  end
end

class DomainConstraint
  def self.matches?(request)
    unpermitted = 'extranet'
    !request.subdomain.include? unpermitted
  end
end

Rails.application.routes.draw do

  mount RedactorRails::Engine => '/redactor_rails'
  devise_for :user_candidates

  constraints SubdomainConstraint do
    devise_for :users, :path  => '', controllers: { registrations: 'registrations'}

    authenticate :user do
      mount Dashboard::Engine                => '/',               as: 'dashboard',                 module: 'dashboard'
      mount Cms::Engine                      => "/cms",            as: 'cms',                       module: 'cms'
      mount Person::Engine                   => "/pessoas",        as: 'person',                    module: 'person'
      mount Helpdesk::Engine                 => "/helpdesk",       as: 'helpdesk',                  module: 'helpdesk'
      mount Protocol::Engine                 => "/protocolo",      as: 'protocol',                  module: 'protocol'
      mount Attendance::Engine               => "/atendimento",    as: 'attendance',                module: 'attendance'
      mount Concourse::Engine                => "/concurso",       as: 'concourse',                 module: 'concourse'
      mount Finance::Engine                  => "/financeiro",     as: 'finance',                   module: 'finance'
      mount Candidate::Engine                => "/candidatos",     as: 'candidate',                 module: 'candidate'
      mount Schedule::Engine                 => "/agendamento",    as: 'schedule',                  module: 'schedule'
      mount Regularization::Engine           => "/regularizacao",  as: 'regularization',            module: 'regularization'
      mount Habitation::Engine               => "/habitacao",      as: 'habitation',                module: 'habitation'
      mount Entity::Engine                   => "/entidades",      as: 'entity',                    module: 'entity'
      mount Sefaz::Engine                    => "/sefaz",          as: 'sefaz',                     module: 'sefaz'
      mount Firm::Engine                     => "/empresa",        as: 'firm',                      module: 'firm'
    end
  end

  constraints DomainConstraint do
    mount Portal::Engine                => '/',                 as: 'portal',                       module: 'portal'
    mount RegularizationPortal::Engine  => '/regularizacao',    as: 'regularization_portal',        module: 'regularization_portal'
    mount HabitationPortal::Engine      => "/habitacao",        as: 'habitation_portal',            module: 'habitation_portal'
    mount EntityPortal::Engine          => "/entidades",        as: 'entity_portal',                module: 'entity_portal'
    mount SchedulePortal::Engine        => '/agendamento',      as: 'shedule_portal',               module: 'schedule_portal'
    mount ConcoursePortal::Engine       => "/concursos",        as: 'concourse_portal',             module: 'concourse_portal'
    mount FirmPortal::Engine            => "/empresa",          as: 'firm',                         module: 'firm_portal'
  end

  mount Address::Engine                  => "/endereco",       as: 'address'

end
