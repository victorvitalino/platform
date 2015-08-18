require_dependency "person/application_controller"

module Person
	class SectorsController < ApplicationController
		layout 'layouts/material'
		before_action :set_sectors, only: [:index, :create, :destroy, :update]
		before_action :set_sector, only: [:edit, :destroy, :update]

		def index
			authorize @sectors
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


		def set_sectors
			@sectors = Sector.includes(:responsible).all
			@person = Staff.all
		end

		def set_sector
			@sector = Sector.find(params[:id])
		end
	end
end
