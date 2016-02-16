require_dependency 'entity_portal/application_controller'
module EntityPortal
  module RestrictArea
    class MembersController < ApplicationController
      before_action :validate_session!
      before_action :set_tab

      def index
        @member = Entity::Member.new
      end

      def create
        @member = Entity::Member.new(set_params)
        @member.cadastre_id = @entity.id
        if @member.save
          flash[:success] = t :success
          redirect_to action: 'index'
        else
          flash[:danger] = t :danger
          render action: 'index'
        end

      end

      def destroy
        @member = @entity.members.find(params[:id])

        if @member.destroy
          flash[:success] = t :success
        else
          flash[:danger] = t :danger
        end

        redirect_to action: 'index'
      end

      private

      def set_params
        params.require(:member).permit(:name, :cpf, :rg, :rg_org, :born, :telephone, :telephone_optional,
                                       :celphone, :member_job_id, :certificate_civil_criminal, :photo,
                                       member_additionals_attributes: [:cnpj, :social_reason, :member_job_id,:start, :end])
      end

      def validate_session!
        if session[:entity_auth_id].present? && session[:entity_expiration_id].present? && session[:entity_expiration_id] > Time.now
          @entity = Entity::Cadastre.find(session[:entity_auth_id])
        else
          redirect_to entity_portal.new_authorization_path
        end
      end

      def set_tab
        @tab = 'members'
      end
    end
  end
end