module Address
  class DocumentsController < ApplicationController
      layout 'shared/empty'


      def descriptive
        @candidate = Candidate::CadastreAddress.where(cadastre_id: params[:id]).last
        @inheritors = Candidate::Inheritor.where(cadastre_id: params[:id])

        if @candidate.unit.registry_units.last.situation != 0 && @candidate.unit == true && @candidate.unit.notary_offices.last.declaratory_act_number.present?
          flash[:warning] = "Ficha não pode ser emitida para esse cadastro."
          redirect_to candidate.cadastre_addresses_path
        end

      end

      def positive_certificate
        @candidate = Candidate::CadastreAddress.where(cadastre_id: params[:id]).last

        if @candidate.unit.registry_units.last.situation != 0 && @candidate.unit == true && @candidate.unit.notary_offices.last.declaratory_act_number.present?
          flash[:warning] = "Ficha não pode ser emitida para esse cadastro."

          redirect_to candidate.cadastre_addresses_path
        end

      end

  end
end
