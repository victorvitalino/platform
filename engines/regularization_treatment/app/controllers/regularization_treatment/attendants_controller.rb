require_dependency "regularization_treatment/application_controller"

module RegularizationTreatment
  class AttendantsController < ApplicationController
    before_action :set_attendant, only: [:show, :edit, :update, :destroy]

    # GET /attendants
    def index
      @attendants = Attendant.all
    end

    # GET /attendants/1
    def show
    end

    # GET /attendants/new
    def new
      @attendant = Attendant.new
    end

    # GET /attendants/1/edit
    def edit
    end

    # POST /attendants
    def create
      @attendant = Attendant.new(attendant_params)

      if @attendant.save
        redirect_to @attendant, notice: 'Attendant was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /attendants/1
    def update
      if @attendant.update(attendant_params)
        redirect_to @attendant, notice: 'Attendant was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /attendants/1
    def destroy
      @attendant.destroy
      redirect_to attendants_url, notice: 'Attendant was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_attendant
        @attendant = Attendant.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def attendant_params
        params[:attendant]
      end
  end
end
