require_dependency 'habitation_attendance/application_controller'

module HabitationAttendance
  module Convoke
    class ChecklistsController < ApplicationController
      before_action :set_checklist_type
      before_action :set_cadastre_mirror

      def index
      end
      
      def new     
      end

      private

      def set_checklist_type
        @type = Candidate::ChecklistType.find_by_name('morar_bem')
      end

      def set_cadastre_mirror
        @cadastre_mirror = Candidate::CadastreMirror.find(params[:cadastre_mirror_id])
      end
    end
  end
end