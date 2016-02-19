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

  constraints SubdomainConstraint do
    mount Dashboard::Engine                => '/',               as: 'dashboard',        module: 'dashboard'
    mount Cms::Engine                      => "/cms",            as: 'cms',              module: 'portal'
    mount Person::Engine                   => "/pessoas",        as: 'person',           module: 'management'
    mount Helpdesk::Engine                 => "/helpdesk",       as: 'helpdesk',         module: 'management'
    mount Protocol::Engine                 => "/protocolo",      as: 'protocol',         module: 'protocol'
    mount Attendance::Engine               => "/atendimento",    as: 'attendance',       module: 'habitation'
    mount Concourse::Engine                => "/concurso",       as: 'concourse',        module: 'portal'
    mount Candidate::Engine                => "/candidatos",     as: 'candidate',        module: 'habitation'
    mount Schedule::Engine                 => "/agendamento",    as: 'schedule',         module: 'habitation'
    mount Regularization::Engine           => "/regularizacao",  as: 'regularization',   module: 'habitation'
    mount Habitation::Engine               => "/habitacao",      as: 'habitation',       module: 'habitation'
    mount Entity::Engine                   => "/entidades",      as: 'entity',           module: 'habitation'
    mount Firm::Engine                     => "/empresa",        as: 'firm',             module: 'habitation'
    mount Maintenance::Engine              => "/manutencao",     as: 'maintenance',      module: 'management'
    mount Brb::Engine                      => "/brb",            as: 'brb',              module: 'management'
    mount Archive::Engine                  => "/arquivos",       as: 'archive',          module: 'portal'
  end

  constraints DomainConstraint do
    mount Portal::Engine                => '/',                 as: 'portal',                 module: 'portal'
    mount RegularizationPortal::Engine  => '/regularizacao',    as: 'regularization_portal',  module: 'regularization_portal'
    mount HabitationPortal::Engine      => "/habitacao",        as: 'habitation_portal',      module: 'habitation_portal'
    mount EntityPortal::Engine          => "/entidades",        as: 'entity_portal',          module: 'entity_portal'
    mount SchedulePortal::Engine        => '/agendamento',      as: 'shedule_portal',         module: 'schedule_portal'
    mount ConcoursePortal::Engine       => "/concursos",        as: 'concourse_portal',       module: 'concourse_portal'
    mount FirmPortal::Engine            => "/empresa",          as: 'firm_portal',            module: 'firm_portal'
  end

  mount Address::Engine                 => "/endereco",       as: 'address', module: 'habitation'
  mount Authenticate::Engine            => "/acesso",         as: 'authenticate'         
end