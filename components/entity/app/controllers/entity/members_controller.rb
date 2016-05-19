require_dependency 'entity/application_controller'

module Entity
  class MembersController < ApplicationController
    before_action :set_cadastre
    before_action :set_members, only: [:index, :create, :update, :destroy]
    before_action :set_member, only: [:edit, :update, :destroy]

    def index
    end

    def new
      @member = @cadastre.members.new
    end

    def create
      @member = @cadastre.members.new(set_params)
      @member.save
    end

    def edit
    end

    def update
      @member.update_attributes!(set_params)
    end

    def destroy
      @member.destroy
    end

    private

    def set_params
      params.require(:member).permit(:name, :rg, :rg_org, :born,
                                     :start, :end, :telephone, :celphone,
                                     :telephone_optional, :city_id, :address,
                                     :member_job_id, :cpf, :certificate_civil_criminal)
    end

    def set_member
      @member = @cadastre.members.find(params[:id])
    end

    def set_cadastre
      @cadastre = Entity::Cadastre.find(params[:cadastre_id])
    end

    def set_members
      @members = @cadastre.members
    end

  end
end