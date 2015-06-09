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
  devise_for :users
  constraints SubdomainConstraint do
    get '/', to: "dashboard#index", as: 'root_extranet'
    mount Cms::Engine => "/cms", as: 'cms'
    mount Person::Engine => "/pessoas", as: 'person'
  end

  constraints DomainConstraint do
    get '/', to: "portal/home#index", as: 'root_portal'
  end

  mount Concourse::Engine => "/concursos", as: 'concourse'
  mount Schedule::Engine => "/agendamento", as: 'schedule'
end
