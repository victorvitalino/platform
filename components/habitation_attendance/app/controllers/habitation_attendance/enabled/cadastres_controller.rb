require_dependency 'habitation_attendance/application_controller'

module HabitationAttendance
  module Enabled
    class CadastresController < ApplicationController
    
      def show
        @mirror = Candidate::CadastreMirror.find(params[:id])
      end

      def checklist
        @mirror = Candidate::CadastreMirror.find(params[:cadastre_id])

        render layout: 'patternfly/less-application'
      end
    end
  end
end
