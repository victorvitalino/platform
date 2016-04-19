require_dependency 'habitation/application_controller'

module Habitation
  module Attendance
    class ConclusionsController < ApplicationController
      before_action :set_mirror
      before_action :set_checklists

      def index
      end
          
      def create
        if @mirror.finish_attendance!(current_user.id, 
                                      params['attendance']['situation_attendance'],
                                      params['attendance']['observation'])
        
          redirect_to attendance_attendances_path(cpf: @mirror.cpf)
        else
          render action: :index
        end
      end

      private

      def set_mirror
        @mirror = Candidate::CadastreMirror.find(params[:cadastre_mirror_id])
      end

      def set_checklists
        @type = Candidate::ChecklistType.find_by_name('morar_bem') rescue nil

        if @type.present?
          @checklists = @type.checklists
        else
          @checklists = {}
        end
      end
    end
  end
end