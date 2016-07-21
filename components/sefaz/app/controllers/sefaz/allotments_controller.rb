require_dependency "sefaz/application_controller"

module Sefaz
	class AllotmentsController < ApplicationController

    before_action :set_allotments, only: [:index, :create, :destroy, :update]
		before_action :set_allotment, only: [:edit, :destroy, :update]

    def index

    end

    def new
      @allotment = Sefaz::Allotment.new
    end

    def create
			@allotment = Sefaz::Allotment.new(allotment_params)
			@allotment.staff_id = current_user.id
			@allotment.send_status_id = 1
			#authorize :sector,  :create?
			if @allotment.save
					redirect_to action: 'index'
			else
					render :new
			end
		end

		def edit
		end

		def update
			#authorize :sector,  :update?
			@allotment.update(allotment_params)
		end

		def destroy
			#authorize :sector,  :destroy?
			if @allotment.destroy
				redirect_to action: 'index'
			end
		end

		def to_process
			client = Savon.client(wsdl: 'http://publica.agencianet.fazenda.df.gov.br/codhab/ConsessaoImovel.asmx?wsdl',namespace: nil,encoding: "UTF-8", env_namespace: :soap)
			@allotment = Sefaz::Allotment.find(params[:allotment_id])
			@teste = client.operations
			message = { "num_protocolo"  => @allotment.protocol_return.to_s }
			@response = client.call(:consulta_protocolo, message: message )

			result = @response.hash[:envelope][:body][:consulta_protocolo_response][:consulta_protocolo_result][:detalhe_protocolo_][:detalhe_protocolo]
      byebug

				redirect_to action: 'index'

		end

    private

    def allotment_params
			params.require(:allotment).permit(:staff_id,:error_message,:send_date,:protocol_number,:exemption_type,:notifiers,:cnpj_notifiers, :observation, :send_status_id)
		end

    def set_allotments
			@allotments = Sefaz::Allotment.all
		end

		def set_allotment
			@allotment = Sefaz::Allotment.find(params[:id])
		end

  end
end
