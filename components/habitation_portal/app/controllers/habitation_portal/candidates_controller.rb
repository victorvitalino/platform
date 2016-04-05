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
      @positions = @candidate.positions.where(program_id: params[:program_id]).map { |key| [key.position, [key.created_at.year, key.created_at.month, key.created_at.day]]}

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

    private

    def set_params_find
      params.require(:find).permit(:cpf)
    end

  end
end
