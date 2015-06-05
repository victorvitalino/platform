Schedule::Engine.routes.draw do
  constraints SubdomainConstraint do 
    namespace :administrator, path: '/' do 
    end
  end

  constraints DomainConstraint do 
    namespace :citizen, path: '/' do 
      root 'dashboard#index'

      scope :habitation, path: 'habitacao' do 
      end
    end
  end
end
