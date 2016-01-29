module Schedule
  class ApplicationController < ActionController::Base
    layout 'remark'

    include Pundit
  end
end
