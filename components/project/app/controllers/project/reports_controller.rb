require_dependency 'project/application_controller'
module Project
  class ReportsController < ApplicationController

    def index
      #authorize :report, :index?



    end

  end
end
