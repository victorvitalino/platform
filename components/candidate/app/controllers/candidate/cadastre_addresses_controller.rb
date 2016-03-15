require_dependency 'candidate/application_controller'

module Candidate
  class CadastreAddressesController < ApplicationController

   has_scope :cpf
   has_scope :old_process
   has_scope :address

   before_action :set_cadastre_address , only: [:unallocate, :transfer]

    def index
       authorize :cadastre_address,  :index?
       @address = RegularizationPortal::Address.new
       if params[:cpf].present? || params[:old_process].present? || params[:address].present?
        @candidate = Candidate::CadastreAddress.all
        @candidate = apply_scopes(@candidate).last
       end
    end


    def new
      @candidate = Candidate::CadastreAddress.where(unit_id: params[:id]).last
      @cadastre_address = Candidate::CadastreAddress.new
      @address = Candidate::CadastreAddress.where(unit_id: params[:id])
    end

    def create
      @cadastre_address = Candidate::CadastreAddress.new(set_cadastre_address_params)
      @cadastre_address = get_dominial_chain(@cadastre_address.unit.id)
      @cadastre_address.type_receipt = 0
      @cadastre_address.situation_id = 1
      @cadastre_address.save
    end

    def unallocate

       unless  @candidate.present?
          redirect_to address.units_path
       end
      @address = Candidate::CadastreAddress.where(unit_id: params[:id])
    end

    def deallocate
        redirect_to cadastre_address_path
    end

    def transfer
      @assignee = Candidate::Cadastre.find_by_cpf(params[:cpf])
    end

     private

       def set_cadastre_address_params
            params.require(:cadastre_address).permit(:cadastre_id, :unit_id, :observation,:created_at,:regularization_type_id)
       end

      def set_cadastre_address
         @candidate = Candidate::CadastreAddress.joins("inner join address_registry_units on candidate_cadastre_addresses.unit_id = address_registry_units.unit_id")
                                                                       .where("address_registry_units.situation <> 2 AND candidate_cadastre_addresses.unit_id = ?", params[:id])
      end


  end
end