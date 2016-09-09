require_dependency "person/application_controller"

module Person
	class BranchLinesController < ApplicationController

		before_action :set_sector
		before_action :set_branch_lines, only: [:index, :new,:create, :destroy, :update]
		before_action :set_branch_line, only: [:show,:edit, :destroy, :update]

		def index
			authorize @branch_lines
		end

		def show

		end

		def new
			@branch_line = @sector.branch_line.new
			authorize @branch_line
		end

		def create
			@branch_line = @sector.branch_line.new(branch_line_params)
			authorize @branch_line
			@branch_line.save

		end

		def destroy
			authorize @branch_line
			if @branch_line.destroy

			end
		end

		private

		def branch_line_params
			params.require(:branch_line).permit(:description, :telephone,:status, :sector_id)
		end

		def set_branch_lines
			 @branch_lines = BranchLine.where(:sector_id => params[:sector_id])
		end

		def set_sector
			@sector = Sector.find(params[:sector_id])
		end

		def set_branch_line
			@branch_line = BranchLine.find(params[:id])
		end
	end
end
