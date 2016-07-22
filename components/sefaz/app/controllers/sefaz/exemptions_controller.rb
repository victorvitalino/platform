require_dependency "sefaz/application_controller"

module Sefaz
	class ExemptionsController < ApplicationController

		before_action :set_allotment
		before_action :set_exemption_unitary, only: [:new, :create]
		before_action :set_exemption, only: [:edit, :destroy, :update]

		def index
			@exemptions = @allotment.exemptions
		end

    def new
      @exemption = @allotment.exemptions.new
    end

		def edit

		end

		def update
			@exemption.update(set_exemption_params)
			redirect_to action: 'index'
		end

    def create
      @exemption = @allotment.exemptions.new(set_exemption_params)
			@exemption.unitary = true
			@exemption.save
			@allotment.update(send_status_id: 2)
			redirect_to action: 'new'
		end

	
		def destroy
			if @exemption.destroy
				redirect_to action: 'index'
			end
		end


		private

		def set_exemption_params
			params.require(:exemption).permit(:name, :cpf, :city, :address, :realty_number, :realty_value)
		end
		def set_exemption
			@exemption = Sefaz::Exemption.find(params[:id])
		end

		def set_exemption_unitary
			@exemptions_unitary = @allotment.exemptions.where(unitary: true)
		end

		def set_allotment
			@allotment = Sefaz::Allotment.find(params[:allotment_id])
		end

  end
end
