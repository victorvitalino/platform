require_dependency 'candidate/application_controller'

module Candidate
  class ChecklistTypesController < ApplicationController
    before_action :set_checklist_types
    before_action :set_checklist_type, only: [:edit, :update, :destroy]

    has_scope :by_program

    def index
    end

    def new
      @checklist = ChecklistType.new
    end

    def create
      @checklist = ChecklistType.new(set_params)
      @checklist.save
    end

    def edit
    end

    def update
      @checklist.update(set_params)
    end

    def destroy
      @checklist.destroy
    end
    
    private

    def set_params
      params.require(:checklist_type).permit(:name, :code, :status, :program_id)
    end

    def set_checklist_type
      @checklist = ChecklistType.find(params[:id])
    end

    def set_checklist_types
      @checklists = apply_scopes(ChecklistType).all.order('id DESC')
    end
  end
end