require_dependency "sefaz/application_controller"

module Sefaz
	class AllotmentsController < ApplicationController

    before_action :set_allotments, only: [:index, :create, :destroy, :update]
		before_action :set_allotment, only: [:edit, :destroy, :update, :to_process]

		has_scope :protocolo
		has_scope	:date_create
		has_scope	:notifiers
		has_scope	:send_status
		has_scope	:send_type
		has_scope	:cpf

    def index
			authorize :allotment,  :index?
			@allotments = apply_scopes(@allotments).paginate(:page => params[:page], :per_page => 30)
    end

    def new
			authorize :allotment,  :create?
      @allotment = Sefaz::Allotment.new
    end

    def create
			@allotment = Sefaz::Allotment.new(allotment_params)
			@allotment.staff_id = current_user.id
			@allotment.send_status_id = 1
			authorize :allotment,  :create?
			if @allotment.save
					redirect_to action: 'index'
			else
					render :new
			end
		end

		def edit
		end

		def update
			authorize :allotment,  :update?
			@allotment.update(allotment_params)
			redirect_to allotments_path
		end

		def destroy
			authorize :allotment,  :update?
			if @allotment.destroy
				redirect_to action: 'index'
			end
		end

		def to_process
			authorize :allotment,  :to_process?
			process = Sefaz::Allotment.process(@allotment.id)

			if process
				redirect_to allotment_exemptions_path(@allotment.id)
			else
				flash["warning"] = "O lote ainda não foi processado"
				redirect_to allotments_path
			end
		end

		def send_exemption
			authorize :allotment,  :send_allotment?

		  Sefaz::Allotment.send_allotment(params[:allotment_id], current_user.id)

			redirect_to allotments_path
		end


    private

    def allotment_params
			params.require(:allotment).permit(:staff_id,:error_message,:send_date,:protocol_number,:exemption_type,:notifiers,:cnpj_notifiers, :observation, :send_status_id, :send_type)
		end

    def set_allotments
			@allotments = Sefaz::Allotment.all
		end

		def set_allotment
			params[:id] = params[:id].present? ? params[:id] : params[:allotment_id]
			@allotment = Sefaz::Allotment.find(params[:id])
		end

  end
end
