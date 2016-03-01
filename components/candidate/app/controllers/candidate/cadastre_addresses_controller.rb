require_dependency 'candidate/application_controller'

module Candidate
  class CadastreAddressesController < ApplicationController

   has_scope :cpf
   has_scope :old_process
   has_scope :address

    def index
       authorize :cadastre_address,  :index?
       @address = RegularizationPortal::Address.new
       @candidate = Candidate::CadastreAddress.all
       @candidate = apply_scopes(@candidate).last

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

     private

       def set_cadastre_address_params
            params.require(:cadastre_address).permit(:cadastre_id, :unit_id, :observation,:created_at,:regularization_type_id)
       end


  end
end