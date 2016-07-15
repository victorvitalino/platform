require_dependency 'portal/application_controller'
module Portal
  class MapController < ApplicationController

    def test
      @address = Address::Unit.where(urb:'ETAPA 4C', block: ['QN 18', 'QN 19', 'QN 20'])
      
      @address = @address.joins(:cadastres) if params[:imovel] == "ocupados"
      
      if params[:imovel] == "desocupados"
        @address = @address.joins('LEFT JOIN candidate_cadastre_addresses 
                                   ON candidate_cadastre_addresses.unit_id = address_units.id')
                                .where('candidate_cadastre_addresses.unit_id is null')
      end
      
      @data = Array.new

    
      @address.each do |addr|
        @data << {
          lat: addr.lat,
          lng: addr.lng,
          complete_address: addr.complete_address,
          unit: addr.unit,
          cadastre: {
            name: addr.cadastres.present? ? addr.cadastres.last.name : '',
            cpf: addr.cadastres.present? ? addr.cadastres.last.cpf : '',
            cpf_obsfuscator: addr.cadastres.present? ? addr.cadastres.last.cpf.format_obfuscator_cpf : '',
            contemplated_date: addr.cadastres.present? ? addr.cadastre_address.last.created_at.strftime("%d/%m/%Y") : ''
          }
        }
      end
      
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
      headers['Access-Control-Request-Method'] = '*'
      headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
      
      render json: @data
      #urb = 'ETAPA 4C' AND address_units.group ='8' and block = 'QN 18'
    end

  end
end
