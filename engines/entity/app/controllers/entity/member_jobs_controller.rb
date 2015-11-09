require_dependency 'entity/application_controller'

module Entity
  class MemberJobsController < ApplicationController
    before_action :set_document_category, only: [:edit, :show, :update, :destroy]
    def index
      @jobs = MemberJob.all.order(:created_at)
    end

    def new
      @job = MemberJob.new
    end

    def create
      @job = MemberJob.new(set_params)

      if @job.save
        flash[:success] = t :success
        redirect_to action: 'index'
      else
        render action: 'new'
      end
    end
  
    def edit
    end

    def update
      if @job.update(set_params)
        flash[:success] = t :success
        redirect_to action: 'index'
      else
        render action: 'edit'
      end
    end

    def destroy
      if @job.destroy
        flash[:success] = t :success
      else
        flash[:danger] = t :danger
      end
      redirect_to action: 'index'
    end

    private

    def set_params
      params.require(:member_job).permit(:name, :code, :status)
    end

    def set_document_category
      @job = MemberJob.find(params[:id])
    end
 end
end