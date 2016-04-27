require_dependency 'habitation_portal/application_controller'

module HabitationPortal
  class CandidatesController < ApplicationController
    before_action :set_headers, only: [:detail]

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
          update_dependents: Candidate::Dependent.count_updates(key.created_at),
          update_special_conditions: 0,
          update_old: Candidate::View::GeneralPontuation.is_olders?(key.created_at),
          halted: Candidate::CadastreSituation.halted_day_count(key.created_at),
          update_arrival_df: 0,
          enables_day: Candidate::CadastreSituation.enabled_day_count(key.created_at),
          change_zone: 0,
          update_data: Candidate::Cadastre.updated_day(key.created_at),
          contemplateds_day: Candidate::CadastreSituation.contemplated_day_count(key.created_at)
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
   
    def set_headers
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Request-Method'] = '*'
    end

  end
end
