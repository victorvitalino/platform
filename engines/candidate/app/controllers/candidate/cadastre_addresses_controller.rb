require_dependency 'candidate/application_controller'

module Candidate
  class CadastreAddressesController < ApplicationController


    def index
      @address = RegularizationPortal::Address.new
       if  params[:cpf].present?
        @candidate = Candidate::CadastreAddress.joins(:unit).joins(:cadastre).where('candidate_cadastres.cpf = ?', params[:cpf]).last rescue nil
       end
    end




    def edit
      @address = RegularizationPortal::Address.new
      @candidate = Candidate::CadastreAddress.joins(:unit).joins(:cadastre).where('candidate_cadastres.cpf = ?', params[:cpf]).last rescue nil
    end



  end
end