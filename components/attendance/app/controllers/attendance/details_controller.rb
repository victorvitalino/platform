require_dependency 'attendance/application_controller'

module Attendance
  class DetailsController < ApplicationController
    before_action :invoke_query_params, only: [:show]

    has_scope :by_date, default: Date.today.strftime("%d/%m/%Y")
    has_scope :by_cpf
    has_scope :by_name
    has_scope :by_cnpj
    has_scope :by_hour
    has_scope :by_status
    has_scope :by_name
    has_scope :by_schedule
    
    @@query_params = {}

    def index
      set_query_params

      @schedules = apply_scopes(Schedule::AgendaSchedule).order(:hour)
    end 

    def show
      @candidate     = Candidate::Cadastre.find_by_cpf(params[:id]) rescue nil
    end

    def resume
      @attendance    = Attendance::Cadastre.find(params[:detail_id])
      @checklists    = Attendance::ChecklistType.find_by_name('morar_bem').checklists
    end

    def continue
      @attendance    = Attendance::Cadastre.find(params[:detail_id])
      @router        = Attendance::RouterService.new(@attendance, view_context)

      if @router.routing!
        redirect_to @router.url
      else
        redirect_to detail_path(@candidate.cpf)
      end

    end

    def cancel
      @attendance  = Attendance::Cadastre.find(params[:detail_id])
    end

    def cancel_update
      @attendance  = Attendance::Cadastre.find(params[:detail_id])
      @attendance.cancel!(current_user, set_cancel_params)
    end

    private

    def set_query_params
      @@query_params = @@query_params.nil? ? {} : params
    end

    def invoke_query_params
      @query_params = @@query_params
    end

    def set_cancel_params
      params.require(:cadastre).permit(:cancel_observation)
    end
  end
end