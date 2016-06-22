require_dependency 'portal/application_helper'

module Portal
  class ApplicationController < ActionController::Base
    layout 'shared/portal'

    before_action :verify_domain

    private

    def verify_domain
      domain = PublicSuffix.parse(request.host)
      if domain.to_s == "www.habitabrasilia.df.gov.br"
        redirect_to "/habitabrasilia" unless controller_name == "habita" 
      end
    end
  end
end
