require_dependency 'regularization/application_controller'

module Regularization
  class AgendasController < ApplicationController 
    
    def index
      @agendas = Schedule::Agenda.regularization
    end
    
  end
end