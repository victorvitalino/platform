require 'indication_portal/application_controller'

module IndicationPortal
  class EnterprisesController < ApplicationController

    has_scope :by_enterprise
    has_scope :by_step
    has_scope :by_allotment
    has_scope :by_cpf

    def index

      if params[:by_enterprise].present? || params[:by_cpf].present?
        @cadastres = apply_scopes(Candidate::EnterpriseCadastre.includes(:cadastre)).paginate(:page => params[:page], :per_page => 20)

        @cadastres_count  = @cadastres.count
        @rii_count        = @cadastres.where(source_list: 'RII').count
        @rie_count        = @cadastres.where(source_list: 'RIE').count
        @special_count    = @cadastres.where(source_list: 'DEF').count
        @old_count        = @cadastres.where(source_list: 'IDO').count
        @vul_count        = @cadastres.where(source_list: 'VUL').count



        @cadastres_desactive_count    = @cadastres.where(inactive: true).count
        @cadastres_contemplated       = @cadastres.contemplated(params[:by_enterprise], params[:by_step], params[:by_allotment])
        @cadastres_contemplated_count = @cadastres_contemplated.count
        @cadastres_in_progress_count  = @cadastres.in_process.count

      else
        @cadastres = nil
      end
    end

    def steps
      enterprise_id = params[:enterprise_id] ||= nil

      @steps = Project::Step.where(enterprise_id: enterprise_id)

      render json: @steps
    end

    def allotments

      step_id = params[:step_id] ||= nil

      @allotments = Indication::Allotment.where(step_id: step_id)

      render json: @allotments
    end

  end
end
