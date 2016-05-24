require_dependency 'project/application_controller'

module Project
  class TypologiesController < ApplicationController
    before_action :set_typology, only: [:edit, :update, :destroy]
    
    def index
      @typologies = Project::Typology.all.order(:id)
    end

    def show
    end

    def new
      @typology = Project::Typology.new
    end

    def create
      @typology = Project::Typology.new(set_params)

      if @typology.save
        flash[:success] = t :success
        redirect_to action: :index
      else
        render action: :new
      end
    end

    def edit
    end

    def update
      if @typology.update(set_params)
        flash[:success] = t :success
        redirect_to action: :index
      else
        render action: :edit
      end
    end

    def destroy
      if @typology.destroy
        flash[:success] =  t :success
      else
        flash[:danger] =  t :danger
      end

      redirect_to action: :index
    end

    private

    def set_params
      params.require(:typology).permit(:name, :home_type, :private_area, :income_family,
                                       :initial_value, :end_value, :status)
    end

    def set_typology
      @typology = Project::Typology.find(params[:id])
    end
  end
end