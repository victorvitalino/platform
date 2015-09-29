require_dependency 'app/helpers/application_helper'

module HabitationTreatment
  class ApplicationController < ActionController::Base
   layout 'layouts/material'

    include Pundit

    helper ::ApplicationHelper
  end
end
