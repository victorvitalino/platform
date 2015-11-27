require_dependency 'regularization/application_controller'
require_dependency 'candidate/cadastre'
module Regularization
  class AttendancesController < ApplicationController
    before_action :set_requeriment, except: [:index, :redirect_step]

    def index
      session[:requeriment_id] = nil

      @requeriments = Requeriment.where(cpf: params[:cpf])
      @schedules    = Schedule::AgendaSchedule.where(cpf: params[:cpf])
      @attendances  = Regularization::Attendance.where(cpf: params[:cpf], status: true)
    end

    def redirect_step

      if params[:attendance_id].present?
        @attendance = Regularization::Attendance.find(params[:attendance_id])
        session[:requeriment_id] = @attendance.requeriment_id
     
        case @attendance.attendance_status.code
        when 1
          redirect_to action: 'step_one'
        when 2
          redirect_to action: 'step_two'
        when 3
          redirect_to action: 'step_three'
        when 4
          redirect_to action: 'step_four'
        when 5
        end

      elsif params[:requeriment_id].present?
        session[:requeriment_id] = params[:requeriment_id]
        @attendance = Regularization::Attendance.where(requeriment_id: session[:requeriment_id], status: true).last
        if @attendance.present?
          redirect_to action: 'redirect_step', attendance_id: @attendance.id
        else
          redirect_to action: 'step_one'
        end
      else
        redirect_to action: 'index'
      end

    end

    def step_one

      @requeriment  = Requeriment.find(session[:requeriment_id])
      @attendance   = Regularization::Attendance.step_one(@requeriment.cpf, @requeriment.id)
    end

    def step_two
      @candidate    = Regularization::Cadastre.find_by_cpf(@requeriment.cpf) rescue Cadastre.new
      @attendance   = Regularization::Attendance.step_two(@requeriment.cpf, @requeriment.id)
    end

    def create_step_two
      @candidate = Cadastre.new(set_candidate_params)
      if @candidate.save
        redirect_to action: 'step_three'
      else
        render action: 'step_two'
      end
    end

    def update_step_two
      @candidate = Cadastre.find_by_cpf(@requeriment.cpf)
      if @candidate.update(set_candidate_params)
        redirect_to action: 'step_three'
      else
        render action: 'step_two'
      end
    end

    def step_three
      @checklists   = Candidate::Checklist.where(program_id: 3)
      @attendance   = Regularization::Attendance.step_three(@requeriment.cpf, @requeriment.id)
    end

    private

    def set_candidate_params
      params.require(:cadastre).permit(:name, :cpf, :rg, :rg_org, :rg_uf, :gender, :born, :born_uf,
                                       :place_birth, :telephone, :telephone_optional, :ceĺphone,
                                       :email,:civil_state_id, :cep, :city_id, :address, :complement_address,
                                       :work_city_id, :work_cep, :work_address, :income, :special_condition_id,
                                       :adapted_property, :nis, :cid,:celphone, :address_complement,
                                       dependents_attributes: [:name, :cpf, :rg, :rg_org, :rg_uf_id, :born, 
                                                               :gender, :place_birth, :civil_state_id, :income,
                                                               :kinship_id, :co_acquirer, :percentage, 
                                                               :special_condition_id, :cid, :nis, :id, :_destroy])
    end

    def set_requeriment
      @requeriment  = Requeriment.find(session[:requeriment_id])
    end

    def security_step(requeriment_id, status_id)
      @attendance = Regularization::Attendance.where(requeriment_id: session[:requeriment_id],
                                                 attendance_status_id: status_id,
                                                 status: true)

      #redirect_to action: if @attendance.present?
    end
  end
end