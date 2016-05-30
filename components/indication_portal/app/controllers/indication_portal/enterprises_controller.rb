require 'indication_portal/application_controller'

module IndicationPortal
  class EnterprisesController < ApplicationController
    
    has_scope :by_enterprise
    has_scope :by_step
    has_scope :by_allotment

    def index
      @cadastres = apply_scopes(Indication::Cadastre.includes(:cadastre)).paginate(:page => params[:page], :per_page => 20)
      
      @cadastres_count  = @cadastres.count
      @rii_count        = @cadastres.where(program_id: 1).count
      @rie_count        = @cadastres.where(program_id: 2).count
      @special_count    = @cadastres.where(program_id: 5).count
      @old_count        = @cadastres.where(program_id: 7).count
      @vul_count        = @cadastres.where(program_id: 4).count

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