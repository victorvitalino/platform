require_dependency "sefaz/application_controller"

module Sefaz
	class ExemptionsController < ApplicationController

		before_action :set_allotment
		before_action :set_exemption_unitary, only: [:new, :create, :new_parcial]
		before_action :set_exemption, only: [:edit, :destroy, :update]

		def index
			authorize :exemption,  :index?
			@exemptions = @allotment.exemptions

			respond_to do |format|
				format.html
				format.xlsx  { response.headers['Content-Disposition'] = 'attachment; filename="relatorio_processos.xlsx"' }
			end
		end

    def new
			authorize :exemption,  :create?
      @exemption = @allotment.exemptions.new
    end

		def new_parcial
			@exemption = @allotment.exemptions.new
		end

		def new_total
			@exemption = @allotment.exemptions.new
		end

		def edit
			authorize :exemption,  :update?
		end

		def update
			authorize :exemption,  :update?
			@exemption.update(set_exemption_params)
			redirect_to action: 'index'
		end

    def create
			authorize :exemption,  :create?
      @exemption = @allotment.exemptions.new(set_exemption_params)
			@exemption.unitary = true
			@exemption.save
			@allotment.update(send_status_id: 2)
			if @allotment.send_type.to_i == 1
				redirect_to action: 'new'
			else
				redirect_to action: 'new_parcial'
			end
		end


		def destroy
			authorize :exemption,  :destroy?
			if @exemption.destroy
				redirect_to action: 'index'
			end
		end


		private

		def set_exemption_params
			params.require(:exemption).permit(:name, :cpf, :city, :address, :realty_number, :realty_value, :number_act_to_cancel, :year_act)
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
