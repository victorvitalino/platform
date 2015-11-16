require_dependency "concourse/application_controller"

module Concourse
  class SubscribesController < ApplicationController
    before_action :set_project
    before_action :set_subscribe, only: [:show, :edit, :update, :destroy]

    # GET /subscribes
    def index
      @subscribes = @project.subscribes.all
    end

    # GET /subscribes/1
    def show
    end

    # GET /subscribes/new
    def new
      @subscribe = @project.subscribes.new
      @subscribe.fields.build
    end

    # GET /subscribes/1/edit
    def edit
    end

    # POST /subscribes
    def create
      @subscribe = @project.subscribes.new(subscribe_params)

      if @subscribe.save
        flash[:success] =  t :success
        redirect_to project_path(id: @project, q: 'tipo_inscricoes')
      else
        render :new
      end
    end

    # PATCH/PUT /subscribes/1
    def update
      if @subscribe.update(subscribe_params)
        flash[:success] =  t :success
        redirect_to project_path(id: @project, q: 'tipo_inscricoes')
      else
        render :edit
      end
    end

    # DELETE /subscribes/1
    def destroy
      if @subscribe.destroy
        flash[:success] =  t :success
        redirect_to project_path(id: @project, q: 'tipo_inscricoes')
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_subscribe
        @subscribe = @project.subscribes.find(params[:id])
      end

      def set_project
        @project = Project.friendly.find(params[:project_id])
      end
      # Only allow a trusted parameter "white list" through.
      def subscribe_params
        params.require(:subscribe).permit(:project_id, :title, :fee, :type_guide_id, :start, :end, :publish, :observation,
                                          fields_attributes: [:id, :_destroy, :label, :field_type, :max_size, :file_white_list, :required, :unique, :only_number])
      end
  end
end
