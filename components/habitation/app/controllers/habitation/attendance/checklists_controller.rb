require_dependency 'habitation/application_controller'

module Habitation
  module Attendance
    class ChecklistsController < ApplicationController
      before_action :set_mirror

      def index
      end

      def update
      end
      
      def check
        @checklist = Candidate::Checklist.find(params[:checklist_id])
        @mirror_check = @mirror.cadastre_checklists.new
        @mirror_check.checklist_id = @checklist.id
        @mirror_check.save
      end

      def uncheck
        @checklist = Candidate::Checklist.find(params[:checklist_id])
        @mirror_check = @mirror.cadastre_checklists.find_by_checklist_id(@checklist.id)
        @mirror_check.destroy
      end

      def auth
        @checklist = Candidate::Checklist.find(params[:checklist_id])
        @mirror_check = @mirror.cadastre_checklists.find_by_checklist_id(@checklist.id)
        @mirror_check.update(document_authenticate: true)
      end

      def unauth
        @checklist = Candidate::Checklist.find(params[:checklist_id])
        @mirror_check = @mirror.cadastre_checklists.find_by_checklist_id(@checklist.id)
        @mirror_check.update(document_authenticate: false)
      end

      private

      def set_mirror
        @type = Candidate::ChecklistType.find_by_name('morar_bem')
        @mirror = Candidate::CadastreMirror.find(params[:cadastre_mirror_id])
      end
    end
  end
end