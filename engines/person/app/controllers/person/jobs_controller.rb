require_dependency "person/application_controller"

module Person
	class JobsController < ApplicationController
		layout 'layouts/material'
		before_action :set_jobs, only: [:index, :create, :destroy, :update]
		before_action :set_job, only: [:edit, :destroy, :update]

		def index
		end

		def new
			@job = Job.new
		end

		def create
			@job = Job.new(job_params)
			@job.save
		end

		def edit
		end

		def update
			@job.update(job_params)
		end

		def destroy
			if @job.destroy
				redirect_to action: 'index'
			end
		end

		private

		def job_params
			params.require(:job).permit(:name, :code,:status)
		end

		def set_jobs
			@jobs = Job.all
		end

		def set_job
			@job = Job.find(params[:id])
		end
	end
end
