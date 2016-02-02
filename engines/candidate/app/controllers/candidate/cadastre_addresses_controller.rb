require_dependency 'candidate/application_controller'

module Candidate
  class CadastreAddressesController < ApplicationController


    def index
       @address = RegularizationPortal::Address.new
       unless  params[:cpf].nil? && params[:cpf].empty?
        @candidate = Candidate::CadastreAddress.joins(:unit).joins(:cadastre).where('candidate_cadastres.cpf = ?', params[:cpf]).last rescue nil
       end
       unless params[:id].nil?
        @candidate = Candidate::CadastreAddress.joins(:unit).where('address_units.id = ?', params[:id]).last rescue nil
       end
    end


    def edit
      @candidate = Candidate::CadastreAddress.joins(:unit).where('address_units.id = ?', params[:id]).last rescue nil
    end



  end
end