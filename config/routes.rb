class SubdomainConstraint
  def self.matches?(request)
    permitted = 'extranet'
    request.subdomain.include? permitted
  end
end

class DomainConstraint
  def self.matches?(request)
    permitted = 'extranet'
    !request.subdomain.include? permitted
  end
end

Rails.application.routes.draw do

  mount RedactorRails::Engine => '/redactor_rails'

  devise_for :user_candidates
  devise_for :users, :path  => '',
             :path_names    => {:sign_in  => 'acesso', :sign_out => 'sair'}

  constraints SubdomainConstraint do
    authenticate :user do
      mount Dashboard::Engine => '/',                                             as: 'dashboard',                module: 'dashboard'
      mount Intranet::Engine => '/intranet',                                      as: 'intranet',                 module: 'intranet'
      mount Cms::Engine => "/cms",                                                as: 'cms',                      module: 'cms'
      mount Person::Engine => "/pessoas",                                         as: 'person',                   module: 'person'
      mount Patrimony::Engine => "/patrimonio",                                   as: 'patrimony',                module: 'patrimony'
      mount Helpdesk::Engine => "/helpdesk",                                      as: 'helpdesk',                 module: 'helpdesk'
      mount Protocol::Engine => "/protocolo",                                     as: 'protocol',                 module: 'protocol'
      mount Juridical::Engine => "/juridico",                                     as: 'juridical',                module: 'juridical'
      mount RegularizationTreatment::Engine  => "/atendimento_regularizacao",     as: 'regularization_treatment', module: 'regularization'
    end
  end

  constraints DomainConstraint do
    mount Portal::Engine => '/',            as: 'portal'
  end

  mount Regularization::Engine  => "/regularizacao",  as: 'regularization'
  mount Schedule::Engine        => "/agendamento",    as: 'schedule'
  mount Notify::Engine          => "/notificacao",    as: 'notify'
  mount Address::Engine         => "/endereco",       as: 'address'
  mount Candidate::Engine       => "/candidatos",     as: 'candidate'
end
