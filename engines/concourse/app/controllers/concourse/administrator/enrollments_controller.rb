module Concourse
  class Administrator::EnrollmentsController < ApplicationController
    layout 'layouts/material' 
    before_action :set_project
    before_action :set_enrollment, only: [:edit, :update, :destroy]
    
    def index
      @enrollments = @project.enrollments.unscoped
    end 

    def new
      @enrollment = @project.enrollments.new
    end

    def create
      @enrollment = @project.enrollments.new(set_enrollment_params)

      if @enrollment.save
        flash[:success] = t :success
        redirect_to action: 'index'
      else
        render action: 'new'
      end
    end

    def edit
    end

    def update
      if @enrollment.update(set_enrollment_params)
        flash[:success] = t :success
        redirect_to action: 'index'
      else
        render action: 'new'
      end
    end

    def destroy
      if @enrollment.destroy
        flash[:success] = t :success
        redirect_to action: 'index'
      end
    end

    private

    def set_enrollment_params
      params.require(:enrollment).permit(:title, :description, :start, :end, :status, :fee, :value_fee)
    end

    def set_enrollment
      @enrollment = @project.enrollments.unscoped.find(params[:id])
    end
    
    def set_project
      @project = Project.find(params[:project_id])
    end

  end
end