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
        [key.position, [key.created_at.year, key.created_at.month, key.created_at.day]]
      end

      respond_to do |format|
        format.json { render json: @positions}
        format.html { @candidate }
        format.js {

          date = Date.parse(params[:date]) rescue nil
          @day = Candidate::DayOcurrency.find_by_date_ocurrency(date) rescue nil

          if @day.present?
            @events    = {
                update_incomes: @day.update_income,
                update_dependents: @day.update_dependent,
                update_special_conditions: @day.update_special_condition,
                update_old: @day.update_old,
                halted: @day.halted,
                update_arrival_df: @day.update_arrival_df,
                enables_day: @day.enables_day,
                change_zone: @day.change_zone,
                update_data: @day.update_data,
                contemplateds_day: @day.contemplated_day
              }
          else
            @events = {}
          end
        }
      end
    end

    def enterprise_cadastre_situation
      @enterprise_cadastre_situation = Candidate::EnterpriseCadastreSituation.where(enterprise_cadastre_id:params[:id])
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
