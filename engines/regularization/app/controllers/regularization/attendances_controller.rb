require_dependency 'regularization/application_controller'
require_dependency 'candidate/cadastre'
module Regularization
  class AttendancesController < ApplicationController
    before_action :set_session, only: [:step_two, :create_step_two, :update_step_two, :step_three]
    def index
      @requeriments = Requeriment.where(cpf: params[:cpf])
      @schedules    = Schedule::AgendaSchedule.where(cpf: params[:cpf])
    end

    def step_one
      @requeriment  = Requeriment.find(params[:requeriment_id])
      session[:requeriment_id] = @requeriment.id
    end

    def step_two
      @candidate = Cadastre.find_by_cpf(@requeriment.cpf) rescue Cadastre.new
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
      @checklists = Candidate::Checklist.where(program_id: 3)
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
                                                               :special_condition_id, :cid, :nis])
    end

    def set_session
      if session[:requeriment_id].present?
        @requeriment  = Requeriment.find(session[:requeriment_id])
      else
        redirect_to new_attendance_path
      end
    end
  end
end