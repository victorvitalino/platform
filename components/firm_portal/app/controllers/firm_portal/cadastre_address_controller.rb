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
      @enterprise_status.observation = "Reserva de imóvel"
      @enterprise_status.status_cadastre_id = 10
      @enterprise_status.save

      @cadastre_address = Candidate::CadastreAddress.new
      @cadastre_address.cadastre_id =  @enterprise_status.cadastre_id
      @cadastre_address.unit_id =   @unit.id
      @cadastre_address.save

      @unit.update(situation_unit_id: 6)

     redirect_to enterprise_cadastres_path

   end

   def sale
       @cadastre_address = Candidate::CadastreAddress.new
   end

   def sell
       @cadastre_address = Candidate::CadastreAddress.where(unit_id: @unit_id).last
       @cadastre_address.update(dominial_chain:0, type_occurrence: 0 ,type_receipt: 0)
       update_tables_sale

        redirect_to enterprise_units_path

   end

   def refund
      @cadastre_address = Candidate::CadastreAddress.where(unit_id: @unit_id).last
      @cadastre_address.destroy
      redirect_to enterprise_units_path
   end



    private



    def enterprise_status_params
      params.require(:enterprise_status).permit(:cadastre_id,:enterprise_cadastre_id,:observation, :status_cadastre_id,:archive_file)
    end

    def address_params
      params.require(:registry_unit).permit(:cadastre_id, :unit_id, :enterprise_id)
    end

    def set_enterprise
      @enterprise = Firm::Enterprise.find(params[:id])
    end



    def set_cadastre_address
       @cadastre_address = Candidate::CadastreAddress.where(params[:id])
    end

    def set_unit
        @unit = Address::Unit.find(params[:enterprise_unit_id])
    end


  end
end
