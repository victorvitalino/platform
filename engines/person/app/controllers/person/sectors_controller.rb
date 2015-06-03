require_dependency "person/application_controller"

module Person
	class SectorsController < ApplicationController
		before_action :set_sectors, only: [:index, :create, :destroy, :update]
		before_action :set_sector, only: [:edit, :destroy, :update]

		def index
		end

		def new
			@sector = Sector.new
		end

		def create
			@sector = Sector.new(sector_params)
			@sector.save
		end

		def edit
		end

		def update
			@sector.update(sector_params)
		end

		def destroy
			if @sector.destroy
				redirect_to action: 'index'
			end
		end

		private

		def sector_params
			params.require(:sector).permit(:name,:acron,:status)
		end

		def set_sectors
			@sectors = Sector.all
		end

		def set_sector
			@sector = Sector.find(params[:id])
		end
	end
end
