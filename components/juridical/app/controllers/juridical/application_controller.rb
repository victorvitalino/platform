module Juridical
  class ApplicationController < ActionController::Base
    layout 'patternfly/application'

    include Authenticate::StaffService
    helper  Authenticate::StaffHelper
    helper  ::NavigationHelper

    before_action :authenticate_staff?

    include Pundit



    private

    def user_not_authorized(exception)
      flash[:alert] = "Você não possue permissão para está ação."
      redirect_to(request.referrer || root_path)
    end


  end
end
