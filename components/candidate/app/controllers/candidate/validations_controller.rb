module Candidate
  class ValidationsController < ApplicationController
    before_action :set_validate, only: [:edit, :update]

    def index
      @validations = Candidate::Validation.all.order(:id)
    end

    def new
      @validate = Candidate::Validation.new
    end

    def create 
      @validate = Candidate::Validation.new(set_params)
      if @validate.save
        flash[:success] =  t :success
        redirect_to action: :index
      else
        render action: :new
      end
    end

    def edit
    end

    def update
      if @validate.update(set_params)
        flash[:success] =  t :success
        redirect_to action: :index
      else
        render action: :edit
      end
    end

    def destroy
      if @validate.destroy
        flash[:success] = t :success
      else 
        flash[:danger] = t :danger
      end

      redirect_to action: :index
    end

    private

    def set_validate
      @validate = Candidate::Validation.find(params[:id])
    end

    def set_params
      params.require(:validation).permit(:name, :target_model_query, :target_model_function, :contain, :description, :status, :description, :code, program_id: [])
    end

  end
end