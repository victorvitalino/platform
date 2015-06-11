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
 
  constraints SubdomainConstraint do

    devise_for :users, path: '/'
    
    authenticate :user do 
      mount Dashboard::Engine => '/',              as: 'dashboard'
      mount Intranet::Engine => '/intranet',       as: 'intranet'
      mount Cms::Engine => "/cms",                 as: 'cms'
      mount Person::Engine => "/pessoas",          as: 'person'
    end
  end
  
  constraints DomainConstraint do
    mount Portal::Engine => '/',            as: 'portal'
  end

  mount Concourse::Engine => "/concursos",  as: 'concourse'
  mount Schedule::Engine => "/agendamento", as: 'schedule'

end
