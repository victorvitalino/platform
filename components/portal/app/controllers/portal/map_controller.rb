require_dependency 'portal/application_controller'
module Portal
  class MapController < ApplicationController

    def test
      @address = Address::Unit.select('address_units.id, address_units.complete_address,
                                      address_units.unit, address_units.coordinate, am.id,
                                      am.unit_id')
                                      .joins('LEFT JOIN candidate_ammvs AS am
                                        ON am.unit_id = address_units.id')
                                      .where("urb = 'ETAPA 4C' and coordinate IS NOT NULL")
      
      @data = Array.new
      @index = 0
      @address.each do |addr|
        @index += 1
        @cdru     = Candidate::Ammv.where(unit_id: addr.id).last
        @tcu      = Candidate::CadastreAddress.where(unit_id: addr.id).order(:created_at).last
        @cadastre = @tcu.present? ? @tcu.cadastre_id : nil

        @in_unit    =  addr.candidate_in_unit
        @crdu_resp  =  @cdru.present? ? @cdru.set_cdru(@tcu) : "Sem registro"
        
        @data << {
          coordinate: addr.coordinate.split(','),
          complete_address: addr.complete_address,
          unit: addr.unit,
          ammvs: {
            cdru: @crdu_resp
          },
          cadastre: {
            cpf:  @in_unit ?  @in_unit.cpf : "Sem registro",
            cpf_formated:  @in_unit ?  @in_unit.cpf.format_cpf : "Sem registro",
            name:  @in_unit ?  @in_unit.name : "Sem registro"
          },
          color: addr.set_color(@in_unit, @crdu_resp)
        }
      end

      
      respond_to do |format|
        format.json {
          headers['Access-Control-Allow-Origin']    = '*'
          headers['Access-Control-Allow-Methods']   = 'POST, PUT, DELETE, GET, OPTIONS'
          headers['Access-Control-Request-Method']  = '*'
          headers['Access-Control-Allow-Headers']   = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
          
          render json: @data
        }

        format.html 
      end
      
    end

  end
end
