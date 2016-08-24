require_dependency "candidate/application_controller"

module Candidate
  class SituationStatusesController < ApplicationController
    before_action :set_situation_status, only: [:show, :edit, :update, :destroy]

    # GET /cadins
    def index
      #authorize :cadin,  :index?
      @situation_statuses = Candidate::SituationStatus.all
    end

    # GET /cadins/1
    def show
    #  authorize :cadin,  :index?
    end

    # GET /cadins/new
    def new
      #authorize :cadin,  :create?
      @situation_status = Candidate::SituationStatus.new
    end

    # GET /cadins/1/edit
    def edit
    end

    # POST /cadins
    def create
      #authorize :cadin,  :create?
      @situation_status = Candidate::SituationStatus.new(situation_status_params)

      @situation_status.save

    end

    # PATCH/PUT /cadins/1
    def update
      #authorize :cadin,  :update?
      @situation_status.update(situation_status_params)      
    end

    # DELETE /cadins/1
    def destroy
      #authorize :cadin,  :destroy?
      @situation_status.destroy
      flash[:success] = "Operação concluída com sucesso."
      redirect_to situation_statuses_url
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_situation_status
        @situation_status = Candidate::SituationStatus.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def situation_status_params
        params.require(:situation_status).permit(:name, :description, :code, :status)
      end
  end
end
