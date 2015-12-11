require_dependency "firm_portal/application_controller"

module FirmPortal
  class CadastreAddressController < ApplicationController

      before_action :set_unit


    def new
      @enterprise_status = Firm::EnterpriseStatus.new
      @candidate_firm = Firm::EnterpriseCadastre.joins(:cadastre).where("candidate_cadastres.cpf = ? AND firm_enterprise_cadastres.status = true",params[:cpf]).last
      if @candidate_firm .present?
       @candidate = Candidate::Cadastre.find(@candidate_firm.cadastre_id)
      end
    end

   def book
      @enterprise_status = Firm::EnterpriseStatus.new(enterprise_status_params)

      @enterprise_status.save

      @cadastre_address = Candidate::CadastreAddress.new
      @cadastre_address.cadastre_id =  @enterprise_status.cadastre_id
      @cadastre_address.unit_id = params[:enterprise_unit_id]
      @cadastre_address.observation = "Reserva de imóvel"
      @cadastre_address.save

       @registry_unit = Address::RegistryUnit.new
        @registry_unit.situation = 6
        @registry_unit.status = true
        @registry_unit.unit_id = params[:enterprise_unit_id]
        @registry_unit.save

        redirect_to enterprise_cadastres_path

   end



    private



    def enterprise_status_params
      params.require(:enterprise_status).permit(:cadastre_id,:enterprise_cadastre_id,:observation, :status_cadastre_id,:archive_file)
    end

    def set_enterprise
      @enterprise = Firm::Enterprise.find(params[:id])
    end



    def set_cadastre_address
       @cadastre_address = Candidate::CadastreAddress.find(params[:id])
    end

    def set_unit
        @unit = Address::Unit.find(params[:enterprise_unit_id])
    end


  end
end
