require_dependency 'candidate/application_controller'

module Candidate
  class CadastreAddressesController < ApplicationController


    def index
      authorize :cadastre_address,  :index?
       @address = RegularizationPortal::Address.new
       if  params[:cpf].present?
        @candidate = Candidate::CadastreAddress.joins(:unit).joins(:cadastre).where('candidate_cadastres.cpf = ?', params[:cpf]).last rescue nil
       end
       if params[:id].present?
        @candidate = Candidate::CadastreAddress.joins(:unit).where('address_units.id = ?', params[:id]).last rescue nil
       end
    end


    def edit
      @candidate = Candidate::CadastreAddress.joins(:unit).where('address_units.id = ?', params[:id]).last rescue nil
    end



  end
end