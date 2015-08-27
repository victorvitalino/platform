require_dependency "juridical/application_controller"

module Juridical
  class AtividadesController < ApplicationController
    before_action :set_atividade, only: [:show, :edit, :update, :destroy]

    # GET /atividades
    def index
      @atividades = Atividade.all
    end

    # GET /atividades/1
    def show
    end

    # GET /atividades/new
    def new
      @atividade = Atividade.new
    end

    # GET /atividades/1/edit
    def edit
    end

    # POST /atividades
    def create
      @atividade = Atividade.new(atividade_params)

      if @atividade.save
        redirect_to @atividade, notice: 'Atividade was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /atividades/1
    def update
      if @atividade.update(atividade_params)
        redirect_to @atividade, notice: 'Atividade was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /atividades/1
    def destroy
      @atividade.destroy
      redirect_to atividades_url, notice: 'Atividade was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_atividade
        @atividade = Atividade.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def atividade_params
        params.require(:atividade).permit(:document_type_id, :action_type_id, :local_instance_id, :date_distribution, :deadline, :days, :end_date, :complemet, :user_id, :status, :monitoring_type, :attachment)
      end
  end
end
