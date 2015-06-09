require_dependency "person/application_controller"

module Person
	class BranchLinesController < ApplicationController
		layout 'layouts/material'
		before_action :set_branch_lines, only: [:index, :create, :destroy, :update]
		before_action :set_branch_line, only: [:show,:edit, :destroy, :update]

		def index
		end

		def show
			@branch_line
		end

		def new
			@branch_line = BranchLine.new
		end

		def create
			@branch_line = BranchLine.new(branch_line_params)
			@branch_line.save
		end

		def edit
		end

		def update
			@branch_line.update(branch_line_params)
		end

		def destroy
			if @branch_line.destroy
				redirect_to action: 'index'
			end
		end

		private

		def branch_line_params
			params.require(:branch_line).permit(:name, :code,:status)
		end

		def set_branch_lines
			@branch_lines = BranchLine.all
		end

		def set_branch_line
			@branch_line = BranchLine.find(params[:id])
		end
	end
end
