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
      @candidate = Candidate::Cadastre.find_by_cpf(params[:id]) rescue nil
    end

    private

    def set_query_params
      @@query_params = @@query_params.nil? ? {} : params
    end

    def invoke_query_params
      @query_params = @@query_params
    end
  end
end