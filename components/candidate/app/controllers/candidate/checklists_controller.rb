require_dependency 'candidate/application_controller'

module Candidate
  class ChecklistsController < ApplicationController
    before_action :set_checklists
    before_action :set_checklist, only: [:edit, :update, :destroy]

    has_scope :by_program

    def index
    end

    def new
      @checklist = Checklist.new
    end

    def create
      @checklist = Checklist.new(set_params)
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
      params.require(:checklist).permit(:name, :code, :status, :program_id)
    end

    def set_checklist
      @checklist = Checklist.find(params[:id])
    end

    def set_checklists
      @checklists = apply_scopes(Checklist).all.order('id DESC')
    end
  end
end