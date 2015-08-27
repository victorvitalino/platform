require_dependency "juridical/application_controller"

module Juridical
  class ActionTypesController < ApplicationController
    before_action :set_action_type, only: [:show, :edit, :update, :destroy]

    # GET /action_types
    def index
      @action_types = ActionType.all
    end

    # GET /action_types/1
    def show
    end

    # GET /action_types/new
    def new
      @action_type = ActionType.new
    end

    # GET /action_types/1/edit
    def edit
    end

    # POST /action_types
    def create
      @action_type = ActionType.new(action_type_params)

      if @action_type.save
        redirect_to @action_type, notice: 'Action type was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /action_types/1
    def update
      if @action_type.update(action_type_params)
        redirect_to @action_type, notice: 'Action type was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /action_types/1
    def destroy
      @action_type.destroy
      redirect_to action_types_url, notice: 'Action type was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_action_type
        @action_type = ActionType.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def action_type_params
        params.require(:action_type).permit(:name, :description)
      end
  end
end
