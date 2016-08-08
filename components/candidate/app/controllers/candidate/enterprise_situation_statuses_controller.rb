require_dependency "candidate/application_controller"

module Candidate
  class EnterpriseSituationStatusesController < ApplicationController
    before_action :set_enterprise_situation_status, only: [:show, :edit, :update, :destroy]

    # GET /inheritors
    def index
      authorize :enterprise_situation_status, :index?
      @enterprise_situation_statuses = EnterpriseSituationStatus.all
    end

    # GET /inheritors/1
    def show
      authorize :enterprise_situation_status, :index?
    end

    # GET /inheritors/new
    def new
      authorize :enterprise_situation_status, :create?
      @enterprise_situation_status = EnterpriseSituationStatus.new
    end

    # GET /inheritors/1/edit
    def edit
      authorize :enterprise_situation_status, :update?
    end

    # POST /inheritors
    def create
      authorize :enterprise_situation_status, :create?
      @enterprise_situation_status = EnterpriseSituationStatus.new(enterprise_situation_status_params)

      if @enterprise_situation_status.save
        redirect_to enterprise_situation_statuses_path

      else
        render :new
      end
    end

    # PATCH/PUT /inheritors/1
    def update
      authorize :enterprise_situation_status, :update?
      if @enterprise_situation_status.update(enterprise_situation_status_params)
        redirect_to enterprise_situation_statuses_path
      else
        render :edit
      end
    end

    # DELETE /inheritors/1
    def destroy
      authorize :enterprise_situation_status, :destroy?
      @enterprise_situation_status.destroy
      redirect_to enterprise_situation_statuses_path
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_enterprise_situation_status
        @enterprise_situation_status = EnterpriseSituationStatus.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def enterprise_situation_status_params
        params.require(:enterprise_situation_status).permit(:name, :description, :status)
      end
  end
end
