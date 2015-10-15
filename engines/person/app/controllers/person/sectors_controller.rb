require_dependency "person/application_controller"

module Person
	class SectorsController < ApplicationController
		layout 'layouts/material'

		before_action :set_sector, only: [:edit, :destroy, :update]

		has_scope :status

		def index
			@sectors = apply_scopes(Sector).includes(:responsible).all
		end

		def new
			@sector = Sector.new
			authorize @sector
		end

		def create
			@sector = Sector.new(sector_params)
			authorize @sector
			@sector.save
		end

		def edit
		end

		def update
			authorize @sector
			@sector.update(sector_params)
		end

		def destroy
			authorize @sector
			if @sector.destroy
				redirect_to action: 'index'
			end
		end

		private

		def sector_params
			params.require(:sector).permit(:name,:acron,:father_id, :responsible_id,:status,:prefex)
		end

		def set_sector
			@sector = Sector.find(params[:id])
		end
	end
end
