require_dependency 'candidate/application_controller'

module Candidate
  class CadastreAddressesController < ApplicationController

   has_scope :cpf
   has_scope :process
   has_scope :address

    def index
       authorize :cadastre_address,  :index?
       @address = RegularizationPortal::Address.new
       @candidate = apply_scopes(Candidate::CadastreAddress).last
    end


    def new
      @cadastre_address = Candidate::CadastreAddress.new
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