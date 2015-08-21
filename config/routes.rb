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
      mount Intranet::Engine                 => '/intranet',       as: 'intranet',                  module: 'intranet'
      mount Cms::Engine                      => "/cms",            as: 'cms',                       module: 'cms'
      mount Person::Engine                   => "/pessoas",        as: 'person',                    module: 'person'
      mount Patrimony::Engine                => "/patrimonio",     as: 'patrimony',                 module: 'patrimony'
      mount Helpdesk::Engine                 => "/helpdesk",       as: 'helpdesk',                  module: 'helpdesk'
      mount Protocol::Engine                 => "/protocolo",      as: 'protocol',                  module: 'protocol'
      mount Juridical::Engine                => "/juridico",       as: 'juridical',                 module: 'juridical'
      mount Attendance::Engine               => "/atendimento",    as: 'attendance',                module: 'attendance'
      mount RegularizationTreatment::Engine  => "/regularizacao",  as: 'regularization_treatment',  module: 'regularization_treatment'
      mount Concourse::Engine                => "/concurso",       as: 'concourse',                 module: 'concourse'
      mount Finance::Engine                  => "/financeiro",     as: 'finance',                   module: 'finance'
    end
  end

  constraints DomainConstraint do
    mount Portal::Engine                => '/',                 as: 'portal'
    mount ConcoursePortal::Engine       => "/concursos",        as: 'concourse_portal',             module: 'concourse_portal'
    mount Regularization::Engine        => "/regularizacao",    as: 'regularization'
  end

  
  mount Address::Engine         => "/endereco",       as: 'address'
 
  mount Candidate::Engine       => "/candidatos",     as: 'candidate'

end
