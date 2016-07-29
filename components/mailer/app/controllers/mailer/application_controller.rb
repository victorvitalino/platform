module Mailer
  class ApplicationController < ActionController::Base

    def entity
      %x[rake mailer:old_entity]
      render json: 'ok'
    end
  end
end
