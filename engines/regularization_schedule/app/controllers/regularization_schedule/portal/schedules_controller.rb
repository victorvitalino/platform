require_dependency "regularization_schedule/application_controller"

module RegularizationSchedule

  module Portal
    class SchedulesController < ApplicationController

    layout 'layouts/portal/application'

    before_action :set_agenda, except: [:my_schedules]
    before_action :set_schedule, only: [:show, :edit, :update, :destroy]

    # GET /schedules
    def index
      @schedules = @agenda.schedules.all
    end

    def  my_schedules
       if session[:candidate_id].present?
        @schedules = RegularizationSchedule::Schedule.where(cpf: params[:cpf])
       else
         redirect_to regularization.candidate_requeriments_path
       end
    end

    # GET /schedules/1
    def show
    end

    # GET /schedules/new
    def new
       @schedule = @agenda.schedules.new
    end



    # GET /schedules/1/edit
    def edit
    end

    # POST /schedules
    def create
      @schedule = @agenda.schedules.new(schedule_params)
      @schedule.status = 0

      if @schedule.save
        redirect_to portal_agenda_schedule_path(@agenda.id,@schedule)
      else
        render :new
      end
    end

    # PATCH/PUT /schedules/1
    def update
      if @schedule.update(schedule_params)
        redirect_to @schedule, notice: 'Schedule was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /schedules/1
    def destroy
      @schedule.destroy
      redirect_to schedules_url

    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_schedule
        @schedule = @agenda.schedules.find(params[:id])
      end

       def set_agenda
         @agenda = Agenda.find(params[:agenda_id])
      end

      # Only allow a trusted parameter "white list" through.
      def schedule_params
        params.require(:schedule).permit(:agenda_id, :requeriment_id, :cpf, :status, :date_schedule, :hour_schedule, :observation)
      end
  end
end
end
