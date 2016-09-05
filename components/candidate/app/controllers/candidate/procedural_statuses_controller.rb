require_dependency "candidate/application_controller"

module Candidate
  class ProceduralStatusesController < ApplicationController
    before_action :set_procedural_status, only: [:show, :edit, :update, :destroy]

    # GET /cadins
    def index
      #authorize :cadin,  :index?
      @procedural_statuses = Candidate::ProceduralStatus.all
    end

    # GET /cadins/1
    def show
    #  authorize :cadin,  :index?
    end

    # GET /cadins/new
    def new
      #authorize :cadin,  :create?
      @procedural_status = Candidate::ProceduralStatus.new
    end

    # GET /cadins/1/edit
    def edit
    end

    # POST /cadins
    def create
      #authorize :cadin,  :create?
      @procedural_status = Candidate::ProceduralStatus.new(procedural_status_params)

      @procedural_status.save

    end

    # PATCH/PUT /cadins/1
    def update
      #authorize :cadin,  :update?
      @procedural_status.update(procedural_status_params)

    end

    # DELETE /cadins/1
    def destroy
      #authorize :cadin,  :destroy?
      @procedural_status.destroy
      flash[:success] = "Operação concluída com sucesso."
      redirect_to situation_statuses_url
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_procedural_status
        @procedural_status = Candidate::ProceduralStatus.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def procedural_status_params
        params.require(:procedural_status).permit(:name, :description, :code, :status)
      end
  end
end
