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
        @obs1 =  @candidate.cadastre.cadastre_activities.where(activity_status_id: 11).last.observation
        if @candidate.cadastre.cadastre_procedurals.last.procedural_status_id == 46
         @obs = "Concessionário de lote residencial com edificação e firmado Termo de Concessão de Uso Oneroso"
        else
          @obs = "Concessionário de lote: Tipo - "
        end
        if @candidate.unit.registry_units.last.situation != 0 && @candidate.unit == true && @candidate.unit.notary_offices.last.declaratory_act_number.present?
          flash[:warning] = "Ficha não pode ser emitida para esse cadastro."

          redirect_to candidate.cadastre_addresses_path
        end

      end

  end
end
