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

  constraints SubdomainConstraint do 
    get '/', to: "dashboard#index", as: 'root_extranet'
  end

  constraints DomainConstraint do 
    get '/', to: "portal/home#index", as: 'root_portal'
  end

  mount Concourse::Engine => "/concurso", as: 'concourse'
  
end
