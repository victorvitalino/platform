module Schedule
  class ApplicationController < ActionController::Base
    layout 'material'

    include Pundit
  end
end
