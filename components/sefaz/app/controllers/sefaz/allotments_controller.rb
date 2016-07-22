require_dependency "sefaz/application_controller"

module Sefaz
	class AllotmentsController < ApplicationController

    before_action :set_allotments, only: [:index, :create, :destroy, :update]
		before_action :set_allotment, only: [:edit, :destroy, :update]
		before_action :set_client, only: [:to_process, :send_exemption]


		has_scope :protocolo
		has_scope	:date_create
		has_scope	:notifiers
		has_scope	:send_status
		has_scope	:send_type

    def index
			@allotments = apply_scopes(@allotments).paginate(:page => params[:page], :per_page => 30)

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
			redirect_to allotments_path
		end

		def destroy
			#authorize :sector,  :destroy?
			if @allotment.destroy
				redirect_to action: 'index'
			end
		end

		def to_process

			@allotment = Sefaz::Allotment.find(params[:allotment_id])

			message = { "num_protocolo"  => @allotment.protocol_return.to_s }
			@response = @client.call(:consulta_protocolo, message: message )

			process = @response.hash[:envelope][:body][:consulta_protocolo_response][:consulta_protocolo_result][:ok]

			if process
				result = @response.hash[:envelope][:body][:consulta_protocolo_response][:consulta_protocolo_result][:detalhe_protocolo_][:detalhe_protocolo]

				if result.count == 5
					cpf = result[:cpf_adquirente]
					@candidate = Sefaz::Exemption.find_by_cpf(cpf)

					if @candidate.present?
						@candidate.act_number = result[:num_ato_declaratorio]
						@candidate.return_message = result[:msg_ret]

						@candidate.save
					end
				else
					result.each do |r|

						cpf = r[:cpf_adquirente]
						@candidate = Sefaz::Exemption.find_by_cpf(cpf)

						if @candidate.present?
						  @candidate.act_number = r[:num_ato_declaratorio]
						  @candidate.return_message = r[:msg_ret]
						  @candidate.save
					  end
					end

				end

				@allotment.update(send_status_id: 4)
				redirect_to allotment_exemptions_path(@allotment.id)
			else
				flash[:warning] = "O lote ainda não foi processado."
				redirect_to allotments_path
			end

		end

		def send_exemption

			@exemption = Sefaz::Exemption.where(allotment_id: params[:allotment_id])

			@xml = Sefaz::Exemption.xml(@exemption)

			@alltoment = Sefaz::Allotment.find(params[:allotment_id])


			message = { "imoveis_xml"  => @xml, "tpImposto" =>  @alltoment.exemption_type.upcase}

			result = @client.call(:receber_inf_imovel_construido, message: message)
			protocol = result.hash[:envelope][:body][:receber_inf_imovel_construido_response][:receber_inf_imovel_construido_result][:protocolo]

			@alltoment.update(send_status_id: 3, send_date: DateTime.now, send_staff_id: current_user.id, protocol_return: protocol)

			redirect_to allotments_path

		end


    private

    def allotment_params
			params.require(:allotment).permit(:staff_id,:error_message,:send_date,:protocol_number,:exemption_type,:notifiers,:cnpj_notifiers, :observation, :send_status_id, :send_type)
		end

		def set_client
				@client = Savon.client(wsdl: 'http://publica.agencianet.fazenda.df.gov.br/codhab/ConsessaoImovel.asmx?wsdl',namespace: nil,encoding: "UTF-8", env_namespace: :soap)
		end

    def set_allotments
			@allotments = Sefaz::Allotment.all
		end

		def set_allotment
			@allotment = Sefaz::Allotment.find(params[:id])
		end

  end
end
