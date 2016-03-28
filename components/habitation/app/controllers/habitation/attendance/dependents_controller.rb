require_dependency 'habitation/application_controller'

module Habitation
  module Attendance
    class DependentsController < ApplicationController
      before_action :set_mirror

      def new
        @dependent = @mirror.dependent_mirrors.new 
      end

      def create
        @dependent = @mirror.dependent_mirrors.new(set_params) 
        @dependent.save
      end
        
      def edit
        @dependent = @mirror.dependent_mirrors.find(params[:id])
      end

      def update
        @dependent = @mirror.dependent_mirrors.update(set_params)
      end  

      def destroy
        @dependent = @mirror.dependent_mirrors.find(params[:id])
        @dependent.destroy
      end
      
      private

      def set_params
        params.require(:dependent_mirror).permit(:cpf, :rg, :rg_org, :name, :born, :gender, :civil_state_id,
                                               :kinship_id, :income, :special_condition_id, :nis, :cid, 
                                               :co_acquirer, :percentage)
      end

      def set_mirror
        @mirror = Candidate::CadastreMirror.find(params[:mirror_id])
      end
    end
  end
end