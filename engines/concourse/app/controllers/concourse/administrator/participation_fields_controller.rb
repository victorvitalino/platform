module Concourse
  class Administrator::ParticipationFieldsController < ApplicationController
    layout 'layouts/material'
    before_action :set_project
    before_action :set_participation
    before_action :set_participation_field, only: [:edit, :update, :destroy]
    before_action :set_participation_fields

    def index
      @participation_fields = @participation.participation_fields.unscoped
    end

    def new
      @participation_field = @participation.participation_fields.new
    end

    def create
      @participation_field = @participation.participation_fields.new(set_enrollment_params)
      @participation_field.save
    end

    def edit
    end

    def update
      @participation_field.update(set_enrollment_params)
    end

    def destroy
      if @participation_field.destroy
        redirect_to action: 'index'
      end
    end

    private

    def set_enrollment_params
      params.require(:participation_field).permit(:name, :field_type, :code, :required, :status)
    end

    def set_project
      @project = Project.find(params[:project_id])
    end

    def set_participation
      @participation = Participation.find(params[:participation_id])
    end

    def set_participation_field
      @participation_field = @participation.participation_fields.unscoped.find(params[:id])
    end

    def set_participation_fields
      @participation_fields = @participation.participation_fields.unscoped
    end
  end
end