require_dependency 'portal/application_controller'
module Portal
  class MapController < ApplicationController

    def index
      @address = Address::Unit.includes([:cadastres, :ammvs]).select('address_units.*, am.cdru')
                                      .joins("LEFT JOIN candidate_ammvs AS am
                                        ON am.unit_id = address_units.id")
                                      .where("urb = 'ETAPA 4C'")

      if params[:by_cdru] == "false"
        @address = @address.where("am.cdru = 'NÃO'")
      elsif params[:by_cdru] == "true"
        @address = @address.where("am.cdru = 'SIM'")
      end

      case params[:by_finance_agent]
      when '0'
        @address = @address.where("am.finance_agent = 'AUTOGESTÃO'")
      when '1'
        @address = @address.where("am.finance_agent = 'SEM AGENTE DEFINIDO'")
      when '2'
        @address = @address.where("am.finance_agent = 'CAIXA'")
      end

      case params[:by_construct]
      when '0'
        @address = @address.where("am.constructor = 'ASSENTADO NO SISTEMA'")
      when '1'
        @address = @address.where("am.constructor = 'AMMVS'")
      when '2'
        @address = @address.where("am.constructor = 'DIRECIONAL'")
      when '3'
        @address = @address.where("am.constructor = 'IPE OMNI'")
      when '4'
        @address = @address.where("am.constructor = 'JCGONTIJO'")
      end

      respond_to do |format|
        format.json {
          headers['Access-Control-Allow-Origin']    = '*'
          headers['Access-Control-Allow-Methods']   = 'POST, PUT, DELETE, GET, OPTIONS'
          headers['Access-Control-Request-Method']  = '*'
          headers['Access-Control-Allow-Headers']   = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
          
          render json: Address::Unit.json(@address)
        }

        format.html 
      end
        
=begin      
      @data = Array.new

      @address.each do |addr|

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
=end
      
      
    end

  end
end
