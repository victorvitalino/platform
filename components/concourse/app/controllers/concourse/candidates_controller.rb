require_dependency 'concourse/application_controller'

module Concourse
  class CandidatesController < ApplicationController
    before_action :set_project, except: [:view_all]

    has_scope :by_concourse
    has_scope :by_situation
    has_scope :by_status
    has_scope :by_cpf
    has_scope :by_id

    def view_all
      authorize :candidate, :index?
      
      @candidates = apply_scopes(Concourse::Candidate).all
      render layout: 'shared/remark'
    end

    def index
      @candidates = @project.candidates
      authorize :candidate, :index?
    end

    def show
      authorize :candidate, :index?
      @candidate = @project.candidates.find(params[:id]) 
    end

    private

    def set_project
      @project = Concourse::Project.friendly.find(params[:project_id])
    end

  end
end