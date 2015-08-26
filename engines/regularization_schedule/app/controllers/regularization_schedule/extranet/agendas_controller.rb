require_dependency "regularization_schedule/application_controller"

module RegularizationSchedule
  class Extranet::AgendasController < ApplicationController

     layout 'layouts/material'

    before_action :set_agenda, only: [:show, :edit, :update, :destroy]
    before_action :set_agendas, only: [:index]
    # GET /agendas
    def index

    end

    # GET /agendas/1
    def show
    end

    # GET /agendas/new
    def new
      @agenda = Agenda.new
    end

    # GET /agendas/1/edit
    def edit
    end

     def show_hour
      @agenda  = Agenda.find(params[:agenda_id])
      @date   = params[:date]
      render :json => @agenda.time_by_date(@date)
    end

    # POST /agendas
    def create
      @agenda = Agenda.new(agenda_params)

      if @agenda.save
        redirect_to  :show, notice: 'Agenda was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /agendas/1
    def update
      if @agenda.update(agenda_params)
        redirect_to :show, notice: 'Agenda was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /agendas/1
    def destroy
      @agenda.destroy
      redirect_to agendas_url, notice: 'Agenda was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_agenda
        @agenda = Agenda.unscoped.find(params[:id])
      end

      def set_agendas
        @agendas = Agenda.unscoped.all
      end

      # Only allow a trusted parameter "white list" through.
      def agenda_params
        params.require(:agenda).permit(:title, :description, :start, :end, :hour_start,
                                                          :hour_end, :publish, :city_id, :station_id, :quantity_attendants,
                                                          :time_attendant, :lunch, :lunch_start, :lunch_end, :lunch_attendants,
                                                          :lunch_time_attendant, :validate_sql, :validate_type, :validate_agenda)
      end
  end
end
