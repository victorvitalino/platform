require_dependency 'project/application_controller'

module Project
  class EnterprisesController < ApplicationController
    before_action :set_enterprise, only: [:edit, :update, :destroy]
    
    def index
      @enterprises = Project::Enterprise.all.order(:id)
    end

    def show
    end

    def new
      @enterprise = Project::Enterprise.new
    end

    def create
      @enterprise = Project::Enterprise.new(set_params)

      if @enterprise.save
        flash[:success] = t :success
        redirect_to action: :index
      else
        render action: :new
      end
    end

    def edit
    end

    def update
      if @enterprise.update(set_params)
        flash[:success] = t :success
        redirect_to action: :index
      else
        render action: :edit
      end
    end

    def destroy
      if @enterprise.destroy
        flash[:success] =  t :success
      else
        flash[:danger] =  t :danger
      end

      redirect_to action: :index
    end

    private

    def set_params
      params.require(:enterprise).permit(:name, :value, :typology_id, :company_id, :edict_number, 
                                         :process_number, :status, :situation, :units)
    end

    def set_enterprise
      @enterprise = Project::Enterprise.find(params[:id])
    end
  end
end