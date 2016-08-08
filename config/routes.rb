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

    post '/tinymce_assets' => 'archive/images#upload_file'

    mount Dashboard::Engine                => '/',               as: 'dashboard',             module: 'dashboard'
    mount Cms::Engine                      => "/cms",            as: 'cms',                   module: 'portal'
    mount Person::Engine                   => "/pessoas",        as: 'person',                module: 'management'
    mount Protocol::Engine                 => "/protocolo",      as: 'protocol',              module: 'protocol'
    mount Juridical::Engine                => "/juridico",       as: 'juridical',             module: 'juridical'
    mount Attendance::Engine               => "/atendimento",    as: 'attendance',            module: 'habitation'
    mount Concourse::Engine                => "/concurso",       as: 'concourse',             module: 'portal'
    mount Candidate::Engine                => "/candidatos",     as: 'candidate',             module: 'habitation'
    mount Schedule::Engine                 => "/agendamento",    as: 'schedule',              module: 'habitation'
    mount Regularization::Engine           => "/regularizacao",  as: 'regularization',        module: 'habitation'
    mount Habitation::Engine               => "/habitacao",      as: 'habitation',            module: 'habitation'
    mount Entity::Engine                   => "/entidades",      as: 'entity',                module: 'habitation'
    mount Firm::Engine                     => "/empresa",        as: 'firm',                  module: 'habitation'
    mount Maintenance::Engine              => "/manutencao",     as: 'maintenance',           module: 'management'
    mount Brb::Engine                      => "/brb",            as: 'brb',                   module: 'management'
    mount Archive::Engine                  => "/arquivos",       as: 'archive',               module: 'portal'
    mount ProfileUser::Engine              => "/usuario",        as: 'profile_user',          module: 'dashboard'
    mount Address::Engine                  => "/enderecos",      as: 'address',               module: 'address'
    mount Action::Engine                   => "/acao",           as: 'action',                module: 'action'
    mount Project::Engine                  => "/projeto",        as: 'project',               module: 'project'
    mount Indication::Engine               => "/indicacao",      as: 'indication',            module: 'indication'
    mount Visit::Engine                    => "/visita",         as: 'visit',                 module: 'visit'
    mount Mailer::Engine                   => "/mailer",         as: 'mailer',                module: 'mailer'
    mount Sefaz::Engine                    => "/sefaz",          as: 'sefaz',                 module: 'sefaz'
    mount Helpdesk::Engine                 => "/helpdesk",       as: 'helpdesk',              module: 'helpdesk'

    mount HabitationAttendance::Engine     => "/atendimento_habitacao",    as: 'habitation_attendance',  module: 'atendimento_habitacao'
  end

  constraints DomainConstraint do
    mount Geo::Engine                   => "/localizacao",      as: 'geo',                    module: 'geo'
    mount Portal::Engine                => '/',                 as: 'portal',                 module: 'portal'
    mount RegularizationPortal::Engine  => '/regularizacao',    as: 'regularization_portal',  module: 'regularization_portal'
    mount HabitationPortal::Engine      => "/habitacao",        as: 'habitation_portal',      module: 'habitation_portal'
    mount EntityPortal::Engine          => "/entidades",        as: 'entity_portal',          module: 'entity_portal'
    mount SchedulePortal::Engine        => '/agendamento',      as: 'shedule_portal',         module: 'schedule_portal'
    mount ConcoursePortal::Engine       => "/concursos",        as: 'concourse_portal',       module: 'concourse_portal'
    mount FirmPortal::Engine            => "/empresa",          as: 'firm_portal',            module: 'firm_portal'
    mount IndicationPortal::Engine      => "/indicacao",        as: 'indication_portal',      module: 'indication_portal'
    mount ActionPortal::Engine          => "/acoesurbanas",     as: 'action_portal',          module: 'action_portal'

  end
  mount Api::Engine                      => "/api",            as: 'api',                   module: 'api'

  mount Authenticate::Engine            => "/acesso",         as: 'authenticate'
end
