require_dependency 'portal/application_controller'
module Portal
  class HomeController < ApplicationController
    def index
      @service_results = Cms::ServiceResult.where(status: true).order(:date)
    end

  end
end
