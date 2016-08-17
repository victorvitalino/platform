require_dependency 'attendance/application_controller'

module Attendance
  module Enabled
    class ChecklistsController < ApplicationController
      before_action :set_checklists
      before_action :set_cadastre_mirror
      
      def index
      end

      def check
        @mirror = @cadastre_mirror.attendance_cadastre.cadastre_checklists.new({
          checklist_id: params[:checklist_id]
        }) 
        @mirror.save
      end

      def uncheck
        @mirror = @cadastre_mirror.attendance_cadastre.cadastre_checklists.find_by_checklist_id(params[:checklist_id])
        @mirror.destroy
      end
      
      private

      def set_checklists
        @checklist_type = Attendance::ChecklistType.find_by_name('morar_bem').checklists
      end

      def set_cadastre_mirror
        @cadastre_mirror = Attendance::Enabled::CadastreMirror.find(params[:cadastre_mirror_id])
      end

    end
  end
end