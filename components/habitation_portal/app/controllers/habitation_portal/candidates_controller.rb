require_dependency 'habitation_portal/application_controller'

module HabitationPortal
  class CandidatesController < ApplicationController

    def find_candidate
      @candidate = Find.new
    end

    def show_candidate
      @candidate = Find.new(set_params_find)

      if @candidate.valid?
        redirect_to action: 'show', id: @candidate.cpf
      else
        render action: 'find_candidate'
      end
    end

    def show
      @candidate = Candidate::Cadastre.by_cpf(params[:id]).first
    end

    def detail

      @candidate = Candidate::Cadastre.by_cpf(params[:candidate_id]).first
      @positions = @candidate.positions.where(program_id: params[:program_id]).map do |key|
        @events    = {
          update_incomes: 0,
          update_dependents: 0,
          update_special_conditions: 0,
          update_old: 0,
          halted: 0,
          update_arrival_df: 0,
          time_list: 0,
          enables_day: 0,
          change_zone: 0,
          change_zone: 0,
          update_data: 0,
          contemplateds_day: 0
        }

        [key.position, [key.created_at.year, key.created_at.month, key.created_at.day], @events]
      end

      respond_to do |format|
        format.json { render json: @positions}
        format.html { @candidate }
      end
    end

    def update_positions
      @day      = params[:by_date].present? ? params[:by_date] : Date.today.strftime('%d/%m/%Y')
      @zone     = params[:by_zone].present? ? params[:by_zone] : 1
      @program  = params[:by_program].present? ? params[:by_program] : 1

      @positions = Candidate::Position.update_by_day(@day, @zone, @program, params[:page])
    end

    def programs
      render json: ['RII', 'RIE', 'DEFICIÊNTES', 'VULNERÁVEL', 'IDOSOS']
    end

    private

    def set_params_find
      params.require(:find).permit(:cpf)
    end

  end
end
