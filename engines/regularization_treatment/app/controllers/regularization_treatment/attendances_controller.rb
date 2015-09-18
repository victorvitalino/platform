require_dependency 'regularization_treatment/application_controller'

module RegularizationTreatment
  class AttendancesController < ApplicationController
    before_action :authorized?
    before_action :set_requeriment
    before_action :set_program

    def address_step
      # program 1 => regularização, 2 => habitação
      # attendance_status => 1 => atendimento iniciado
     
      @attendance_status = Candidate::AttendanceStatus.find_by_code(1)

      @attendance = Candidate::AttendanceCadastre.new
      @attendance.requeriment_id        = @requeriment.id
      @attendance.program_id            = @program.id
      @attendance.attendance_status_id  = @attendance_status.id
      @attendance.status                = true
      @attendance.attendant_id          = current_user.account.attendant.id
      @attendance.convocation_id        = current_user.account.attendant.station.convocation_id

      if @attendance.save
        flash[:success] = "Atendimento iniciado com sucesso!"
        redirect_to new_requeriment_address_path(@requeriment)
      else
        flash[:danger] = 'não foi possível iniciar o atendimento! Tente novamente em instantes.'
        redirect_to new_consult_path
      end
    
    end


    def cadastre_step
      @attendance_status = Candidate::AttendanceStatus.find_by_code(2)

      @attendance = Candidate::AttendanceCadastre.new
      @attendance.requeriment_id        = @requeriment.id
      @attendance.program_id            = @program.id
      @attendance.attendance_status_id  = @attendance_status.id
      @attendance.status                = true
      @attendance.attendant_id          = current_user.account.attendant.id
      @attendance.convocation_id        = current_user.account.attendant.station.convocation_id

      if @attendance.save
        if @attendance_old = Candidate::AttendanceCadastre.where('id <>  ? AND requeriment_id = ?', @attendance.id, @requeriment.id).update_all(status: false)
          redirect_to new_requeriment_cadastre_path(@requeriment)
        else
          redirect_to new_consult_path
        end
      else
        flash[:danger] = 'não foi possível continuar o atendimento! Tente novamente em instantes.'
        redirect_to new_consult_path
      end
    
    end

    def kin_step
      @attendance_status = Candidate::AttendanceStatus.find_by_code(3)

      @attendance = Candidate::AttendanceCadastre.new

      @attendance.requeriment_id        = @requeriment.id
      @attendance.program_id            = @program.id
      @attendance.attendance_status_id  = @attendance_status.id
      @attendance.status                = true
      @attendance.attendant_id          = current_user.account.attendant.id
      @attendance.convocation_id        = current_user.account.attendant.station.convocation_id

      if @attendance.save
        if @attendance_old = Candidate::AttendanceCadastre.where('id <>  ? AND requeriment_id = ?', @attendance.id, @requeriment.id).update_all(status: false)
          redirect_to new_requeriment_kin_path(@requeriment)
        else
          redirect_to new_consult_path
        end
      else
        flash[:danger] = 'não foi possível continuar o atendimento! Tente novamente em instantes.'
        redirect_to new_consult_path
      end
    
    end

    def checklist_step

      @attendance_status = Candidate::AttendanceStatus.find_by_code(4)

      @attendance = Candidate::AttendanceCadastre.new

      @attendance.requeriment_id        = @requeriment.id
      @attendance.program_id            = @program.id
      @attendance.attendance_status_id  = @attendance_status.id
      @attendance.status                = true
      @attendance.attendant_id          = current_user.account.attendant.id
      @attendance.convocation_id        = current_user.account.attendant.station.convocation_id

      if @attendance.save
        if @attendance_old = Candidate::AttendanceCadastre.where('id <>  ? AND requeriment_id = ?', @attendance.id, @requeriment.id).update_all(status: false)
          redirect_to new_requeriment_checklist_path(@requeriment)
        else
          redirect_to new_consult_path
        end
      else
        flash[:danger] = 'não foi possível continuar o atendimento! Tente novamente em instantes.'
        redirect_to new_consult_path
      end
    
    end

    def supervisor_step
    end

    def replay

      @attendance = @requeriment.attendance_cadastres.last

      case @attendance.attendance_status.code
      when 1
        redirect_to new_requeriment_address_path(@requeriment)
      when 2
        redirect_to new_requeriment_cadastre_path(@requeriment)
      when 3
        redirect_to new_requeriment_kin_path(@requeriment)
      when 4
      end
        
    end

    private

    def set_requeriment
      if params[:requeriment_id].present?
        @requeriment = Regularization::Requeriment.find(params[:requeriment_id])
      else
        redirect_to new_consult_path
      end
    end

    def authorized?
      authorize :attendance, :attendant?
    end

    def set_program
       @program = Candidate::Program.find_by_code(1)
    end
  end
end