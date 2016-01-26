require_dependency 'habitation/application_controller'

module Habitation
  class LogsController < ApplicationController 

    def view_update_log
      @log = Candidate::CadastreLog.find(params[:id])

      @cadastre_old = @log.cadastre_old.to_s
      @cadastre_new = @log.cadastre_new.to_s
      
    end

  end
end