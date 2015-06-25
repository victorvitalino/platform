module Concourse
  class Administrator::EnrollmentFieldsController < ApplicationController
    layout 'layouts/material'
    before_action :set_project
    before_action :set_enrollment
    before_action :set_enrollment_field, only: [:edit, :update, :destroy]
    before_action :set_enrollment_fields

    def index
      @enrollment_fields = @enrollment.enrollment_fields
    end

    def new
      @enrollment_field = @enrollment.enrollment_fields.new
    end

    def create
      @enrollment_field = @enrollment.enrollment_fields.new(set_enrollment_params)
      @enrollment_field.save
    end

    def edit
    end

    def update
      @enrollment_field.update(set_enrollment_params)
    end

    def destroy
      if @enrollment_field.destroy
        redirect_to action: 'index'
      end
    end

    private

    def set_enrollment_params
      params.require(:enrollment_field).permit(:name, :field_type, :length, :required, :unique, :status)
    end

    def set_project
      @project = Project.find(params[:project_id])
    end

    def set_enrollment
      @enrollment = Enrollment.find(params[:enrollment_id])
    end

    def set_enrollment_field
      @enrollment_field = @enrollment.enrollment_fields.find(params[:id])
    end

    def set_enrollment_fields
      @enrollment_fields = @enrollment.enrollment_fields
    end
  end
end