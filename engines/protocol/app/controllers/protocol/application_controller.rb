require_dependency 'protocol/application_helper'

module Protocol
  class ApplicationController < ActionController::Base
    layout 'remark'

    include Authenticate::StaffService
    helper  Authenticate::StaffHelper

    before_action :authenticate_staff?

    include Pundit

    private

    def user_not_authorized(exception)
      flash[:alert] = "Você não possue permissão para está ação."
      redirect_to(request.referrer || root_path)
    end

  end
end
